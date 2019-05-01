//
//  ViewController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/1/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import UIKit
import AppDynamics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let errorMsg = ErrorMsg(message: "bre")
        
        errorMsg.initRealm()
        
        print("Success Realm initialization!")
    }


}

