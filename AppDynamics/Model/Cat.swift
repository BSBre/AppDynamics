//
//  Cat.swift
//  AppDynamics
//
//  Created by Bojan Savic on 5/1/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import RealmSwift

class Cat: Object {
    @objc dynamic var name: String?
    @objc dynamic var color: String?
    @objc dynamic var gender: String?
    
}
