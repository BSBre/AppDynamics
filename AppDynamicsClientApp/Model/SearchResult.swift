//
//  SearchResultElement.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/11/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import Alamofire


class SearchResult {
    var _title: String!
    var _imageUrl: String!
    var _description: String!
    var _date: String!
    
    init() {
        
    }
    
    init(title: String, description: String, date: String, imageUrl: String) {
        self._title = title
        self._description = description
        self._date = date
        self._imageUrl = imageUrl
    }
    
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
    
}
