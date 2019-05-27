//
//  User.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/9/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
