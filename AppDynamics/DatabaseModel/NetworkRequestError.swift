//
//  NetworkRequestError.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class NetworkRequestError: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var type: String = ""
    @objc dynamic var descr: String = ""
    
    @objc dynamic var networkRequest: NetworkRequest?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
