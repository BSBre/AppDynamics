//
//  NetworkRequest.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class NetworkRequest: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var networkRequestType: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var networkConnection: String = ""
    @objc dynamic var startRequestTimestamp: Date = Date()
    @objc dynamic var endRequestTimestamp: Date = Date()
    
    let networkRequestErrors = List<NetworkRequestError>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
