//
//  CrashType.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class CrashType: Object {
    dynamic var id: String = UUID().uuidString
    dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
