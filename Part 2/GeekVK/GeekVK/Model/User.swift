//
//  User.swift
//  GeekVK
//
//  Created by Антон Данилов on 12.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit
import SwiftyJSON

class User {
    var id: Int?
    var email: String?
    var password: String?
    var firstName: String?
    var lastName: String?
    var avatar: [UIImage]?
    var groups: Array<Group> = Array()
    var friends: Array<User> = Array()
    
    init(id: Int, email: String, password: String, firstName: String, lastName: String, avatar: [UIImage]) {
        self.id = id
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.email = json["email"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.avatar = [loadAvatarImage(imageURL: json["photo_200_orig"].stringValue)!]
    }
    
    private func loadAvatarImage(imageURL: String) -> UIImage?{
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        
        return UIImage(data: data!) ?? nil
    }
}
