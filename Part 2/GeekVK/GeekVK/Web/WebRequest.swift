//
//  WebRequest.swift
//  GeekVK
//
//  Created by Антон Данилов on 29.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WebRequest {
    
    static let url = "https://api.vk.com/method/"
    
    static func getFriends(completion: @escaping ([User]) -> Void){
        var users = [User]()
        
        let fullURL = url + "friends.get"
        
        let parameters: Parameters = [
            "fields": "id,first_name,last_name,photo_200_orig",
            "v": "5.120",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                let json = JSON(response.value!).dictionaryValue["response"]?.dictionaryValue["items"]
                
                users = JSON(json)
                    .filter {$0.1.dictionaryObject?["first_name"] as? String != "DELETED"}
                    .map {User(json: $0.1)}
                                                
                completion(users)
        }
    }
    
    static func getPhotos(ownerId: Int, completion: @escaping ([UIImage]) -> Void){
        var photos = [UIImage]()
        
        let fullURL = url + "photos.get"
        
        let parameters: Parameters = [
            "owner_id": ownerId,
            "album_id": "profile",
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                let json = JSON(response.value!).dictionaryValue["response"]?.dictionaryValue["items"]
                
                photos = JSON(json)
                    .map {
                        let data = try? Data(contentsOf: URL(string: $0.1.dictionaryObject?["photo_604"] as! String)!)
                        return UIImage(data: data!)!
                }
                                                
                completion(photos)
        }
    }
    
    static func getGroups(completion: @escaping ([Group]) -> Void){
        var groups = [Group]()
        
        let fullURL = url + "groups.get"
        
        let parameters: Parameters = [
            "extended": "1",
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                let json = JSON(response.value!).dictionaryValue["response"]?.dictionaryValue["items"]
                
                groups = JSON(json).map {Group(json: $0.1)}
                                                
                completion(groups)
        }
    }
    
    static func getGroupsForSearch(q: String, completion: @escaping ([Group]) -> Void){
        var groups = [Group]()
        
        let fullURL = url + "groups.search"
        
        let parameters: Parameters = [
            "type": "group",
            "q": q,
            "v": "5.21",
            "count": 20,
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                let json = JSON(response.value!).dictionaryValue["response"]?.dictionaryValue["items"]
                
                groups = JSON(json).map {Group(json: $0.1)}
                                                
                completion(groups)
        }
    }
}
