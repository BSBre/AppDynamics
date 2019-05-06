//
//  User.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var id: String = UUID().uuidString
    dynamic var appId: Int = 0
    dynamic var deviceId: Int = 0
    dynamic var appOpeningTimestamp: Date = Date()
    dynamic var descr: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
