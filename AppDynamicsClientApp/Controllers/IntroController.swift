//
//  NavigationController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/26/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import UIKit

class IntroController: UIViewController {
    
    
    @IBOutlet weak var apodButton: UIButton!
    @IBOutlet weak var nasaSearchEngineButton: UIButton!
    
    @IBOutlet weak var apodLabel: UILabel!
    @IBOutlet weak var nasaSearchEngineLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
    }
    
    @IBAction func apodButtonPressed(_ sender: Any) {
    }
    
    @IBAction func nasaSearchEngineButtonPressed(_ sender: Any) {
    }
    
    @objc func tapGestureApod(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "NasaController") as? NasaController else {
            print("Couldn't find the view controller")
            return
        }
        destinationViewController.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(destinationViewController, animated: false)
    }
    
    @objc func tapGestureNasaSearchEngine(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "SearchController") as? SearchController else {
            print("Couldn't find the view controller")
            return
        }
        destinationViewController.modalTransitionStyle = .crossDissolve
        navigationController?.pushViewController(destinationViewController, animated: false)
    }
    
}
