//
//  Error.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/1/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

public class ErrorMsg {
    internal let message: String
    
    public init(message: String) {
        self.message = message
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
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let myCat = Cat()
        myCat.name = "Moe"
        myCat.gender = "Male"
        myCat.color = "Orange"
        
        try! realm.write {
            realm.add(myCat)
        }
        
    }
}
