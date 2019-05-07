//
//  Controller.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/1/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation

public class Controller {
    internal let message: String
    
    public init(message: String) {
        self.message = message
        initRealm()
    }
    
    public func printMessage(message: String) {
        print("ErrorMsg: \(message)")
    }
    
    public func addNumbers(num1: Int, num2: Int) -> Int {
        var result = 0
        result = num1 + num2
        return result
    }
    
    public func initRealm() {
//        let networkRequest: NetworkRequest = NetworkRequest()
//        let networkRequestError: NetworkRequestError = NetworkRequestError()
//        let crash: Crash = Crash()
        
//        do {
//            try FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
//        } catch {
//            print(error)
//        }
        
        let app = App.shared
        
        print("App name: \(app.name)")
        print("App version: \(app.version)")
        print("App opening timestamp: \(app.appOpeningTimestamp)")
        
//        let realm = try! Realm()
//
//        try! realm.write {
//
//        }
//
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

}
