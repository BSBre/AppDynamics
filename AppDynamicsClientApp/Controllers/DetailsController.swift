//
//  Details.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/12/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import UIKit

class DetailsController: UIViewController {
    
    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descrTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    var searchResult: SearchResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = searchResult?.title ?? ""
        let url = URL(string: searchResult!.imageUrl)
        let data = try? Data(contentsOf: url!)
        
        self.imgImageView.image = UIImage(data: data!)
        
        self.dateLabel.text = searchResult?.date ?? ""
        self.descrTextView.text = searchResult?.description ?? ""
        
        mainView.layer.cornerRadius = 20
    }
    
    func updateUI() {
//        let url = URL(string: nasa.imageUrl)
//        let data = try? Data(contentsOf: url!)
        
    }
    
    func setDetails(details: SearchResult) {
        searchResult = details
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
