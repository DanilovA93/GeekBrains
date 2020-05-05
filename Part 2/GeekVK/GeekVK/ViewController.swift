//
//  ViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 25.04.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDB: [String:String] = ["user1": "123", "user2": "qwe"]
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let userPassword = userDB[loginInput.text!]
        let isValid = userPassword != nil && passwordInput.text == userPassword
        
        if !isValid {
            showLoginError()
        }
        return isValid
    }
    
    private func showLoginError() {
        let alter = UIAlertController(title: "Error", message: "Incorrect user data entered", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo!
        var keyBoardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyBoardFrame = self.view.convert(keyBoardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyBoardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
        print("\(loginInput.text) logout")
    }
}
