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
        
    let token: String = ""
    let userId: Int = 0
    
    private init() {}
}
