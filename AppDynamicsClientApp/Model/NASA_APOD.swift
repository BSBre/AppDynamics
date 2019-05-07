//
//  NASA_APOD.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/7/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import Alamofire

class NASA_APOD {
    var _title: String!
    var _imageUrl: String!
    var _description: String!
    var _date: String!
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var imageUrl: String {
        if _imageUrl == nil {
            _imageUrl = ""
        }
        return _imageUrl
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    
    func downloadDetails(completed: DownloadComplete){
        let currentNASA_URL = URL(string: CURRENT_WEATHER_URL)!
        AF.request(currentNASA_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String, AnyObject> {
                if let title = dict["title"] as? String {
                    self._title = title.capitalized
                    print("Title: \(self._title ?? "Error")")
                }
                
                if let imageUrl = dict["url"] as? String {
                    self._imageUrl = imageUrl
                    print("Image url: \(self._imageUrl ?? "Error")")
                }
                
                if let description = dict["explanation"] as? String {
                    self._description = description
                    print("Description: \(self._description ?? "Error")")
                }
                
                
            }
        }
        completed()
    }
}
