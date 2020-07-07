//
//  Session.swift
//  GeekVK
//
//  Created by Антон Данилов on 23.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import Foundation

class Session {
    static let instance = Session()
        
    var accessToken: String?
    var userId: String?
    
    private init() {}
}
