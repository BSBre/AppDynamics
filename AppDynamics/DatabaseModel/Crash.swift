//
//  Crash.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class Crash: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var crashType: String = ""
    @objc dynamic var appName: String = ""
    @objc dynamic var appVersion: Int = 0
    @objc dynamic var descr: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
