//
//  SearchController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/11/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let BASE_NASA_SEARCH_URL = "https://images-api.nasa.gov/search?q="
let MEDIA_TYPE_NASA_SEARCH_URL = "&media_type=image"
let SEARCH_API_KEY = "?api_key=VZcZ5I1k2gRgsOPJSp5tMI3g5TiN7udYmee0Byvu"

class SearchController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var searchTextfield: String = ""
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var searchKeywordTextField: DesignableTextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    var searchResults: [SearchResult] = [SearchResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 20
        searchKeywordTextField.text = ""
        downloadDetails(searchKeyword: "bre") {
            print("Finished")
            print("searchCell.downloadDetails")
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        self.resultsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchControllerTableViewCell
        
        cell.titleLabel?.text = searchResult.title
        cell.desctriptionLabel?.text = searchResult.description
        cell.dateLabel?.text = searchResult.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchResult = searchResults[indexPath.row]
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailsController") as? DetailsController else {
            print("Couldn't find the view controller")
            return
        }
        destinationViewController.modalTransitionStyle = .crossDissolve
        destinationViewController.setDetails(details: searchResult)
        navigationController?.pushViewController(destinationViewController, animated: false)
//        present(destinationViewController, animated: true, completion: nil)
    }
    
    
    func downloadDetails(searchKeyword: String, completion: @escaping () -> ()) {
        var url: String = "\(BASE_NASA_SEARCH_URL)\(MEDIA_TYPE_NASA_SEARCH_URL)\(SEARCH_API_KEY)"
        print("***")
        print(url)
        url = "https://images-api.nasa.gov/search?media_type=image"
        print("***")
        let currentNASA_URL = URL(string: url)!
        AF.request(currentNASA_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String, AnyObject> {
                if let collection = dict["collection"] as? Dictionary<String, AnyObject> {
                    if let items = collection["items"] as? [Dictionary<String, AnyObject>] {
                        var cnt = 0
                        for item in items {
                            var tmpString: String = ""
                            if let links = item["links"] as? [Dictionary<String, AnyObject>] {
                                for link in links {
                                    if let href = link["href"] as? String {
                                        tmpString = href
                                        break
                                    }
                                }
                            }
                            if let data = item["data"] as? [Dictionary<String, AnyObject>] {
                                for dataElement in data {
                                    if let descr = dataElement["description"] as? String, let date = dataElement["date_created"] as? String, let title = dataElement["title"] as? String {
                                        self.searchResults.append(SearchResult(title: title, description: descr, date: date, imageUrl: tmpString))
                                    }
                                    break
                                }
                            }
                            if cnt == 9 {
                                break
                            }
                            cnt += 1
                        }
                    }
                }
            }
            completion()
        }
    }
    
    
}

