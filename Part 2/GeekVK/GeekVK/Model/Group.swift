//
//  Group.swift
//  GeekVK
//
//  Created by Антон Данилов on 12.05.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit
import SwiftyJSON

class Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.id > rhs.id
    }
    
    var id: Int
    var name: String
    var avatar: UIImage?
    
    init(id: Int, name: String, avatar: UIImage) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.avatar = self.loadAvatarImage(imageURL: json["photo_200"].stringValue)!
    }
    
    private func loadAvatarImage(imageURL: String) -> UIImage?{
        let url = URL(string: imageURL)
        let data = try? Data(contentsOf: url!)
        
        return UIImage(data: data!) ?? nil
    }
}
