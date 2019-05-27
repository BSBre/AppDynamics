//
//  APODController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/7/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import UIKit

class NasaController: UIViewController {
    
    @IBOutlet weak var nasaImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    var nasa = NASA_APOD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nasa.downloadDetails {
            print("Finished")
            print("nasa.downloadDetails")
            self.updateUI()
        }
        
        mainView.layer.cornerRadius = 20
        
    }
    
    func updateUI() {
        let url = URL(string: nasa.imageUrl)
        let data = try? Data(contentsOf: url!)
        
        self.nasaImg.image = UIImage(data: data!)
        
        
        self.titleLabel.text = nasa.title
//        let descr = nasa.description
//        let index = descr.index(descr.startIndex, offsetBy: 500)
//        let description = descr.prefix(upTo: index)
        self.descriptionTextView.text = nasa.description
        dateLabel.text = nasa.date
    }

}
