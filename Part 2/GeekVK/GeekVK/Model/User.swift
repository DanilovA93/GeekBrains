//
//  User.swift
//  GeekVK
//
//  Created by Антон Данилов on 12.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

struct User {
    var id: Int
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var avatar: [UIImage]?
    var groups: Array<Group> = Array()
    var friends: Array<User> = Array()
}
