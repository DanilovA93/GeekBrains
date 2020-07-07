//
//  LoginViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 29.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

//https://vk.com/editapp?id=7525702
class LoginViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        webView.load(loginRequest())        
    }
    
    private func loginRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7525702"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
        ]
        return URLRequest(url: urlComponents.url!)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        Session.instance.accessToken = params["access_token"]
        Session.instance.userId = params["user_id"]
        
        decisionHandler(.cancel)
        
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
    }
}
