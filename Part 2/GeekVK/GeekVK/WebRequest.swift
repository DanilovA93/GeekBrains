//
//  WebRequest.swift
//  GeekVK
//
//  Created by Антон Данилов on 29.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import Foundation
import Alamofire

class WebRequest {
    static let url = "https://api.vk.com/method/"
    
    static func getFriendsIds() {
        let fullURL = url + "friends.get"
        
        let parameters: Parameters = [
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                print(response.value)
        }
    }
    
    static func getPhotos() {
        let fullURL = url + "photos.get"
        
        let parameters: Parameters = [
            "album_id": "profile",
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                print(response.value)
        }
    }
    
    static func getGroupsIds() {
        let fullURL = url + "groups.get"
        
        let parameters: Parameters = [
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                print(response.value)
        }
    }
    
    static func getGroupsIdsForSearch() {
        let fullURL = url + "groups.search"
        
        let parameters: Parameters = [
            "q": "Music",
            "v": "5.21",
            "access_token": Session.instance.accessToken!
        ]
        
        AF.request(fullURL, method: .get, parameters: parameters, headers: nil)
            .responseJSON {(response) in
                print(response.value)
        }
    }
}
