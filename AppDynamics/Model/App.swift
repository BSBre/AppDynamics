//
//  Application.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/6/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation

class App {
    
    static let shared = App()
    
    var name: String
    var version: String
    var descr: String
    var appOpeningTimestamp: Date
    
    private init() {
        name = Bundle.main.infoDictionary!["CFBundleName"] as! String
        version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        descr = ""
        appOpeningTimestamp = Date()
    }
    
}

