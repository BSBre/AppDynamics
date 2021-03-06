//
//  ViewController.swift
//  AppDynamicsClientApp
//
//  Created by Bojan Savic on 5/1/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import UIKit
import AppDynamics
import CoreTelephony
import CoreLocation
import Alamofire

typealias DownloadComplete = () -> ()

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    @IBOutlet weak var logIn: RoundButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: RoundButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var outpostUrl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = Controller(message: "bre")
        
        print(controller.addNumbers(num1: 2, num2: 2))
        print("Success Realm initialization!")
        
        
        print("Device model: \(UIDevice.modelName)")
        print("iOS name: \(UIDevice.current.systemName), iOS version: \(UIDevice.current.systemVersion)")
        
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        
        mainView.layer.cornerRadius = 20
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        tap.numberOfTapsRequired = 1
        outpostUrl.isUserInteractionEnabled = true
        outpostUrl.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationItem.backBarButtonItem?.title = "Back bre"
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Nasa", size: 17)!]
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Nasa", size: 17)!]
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc func tapGesture(_ sender: Any) {
        let url = "https://outpost.rs"
        print("Clicked breeee")
        UIApplication.shared.open(NSURL(string: url)! as URL)
    }
    
//    @IBAction func signUpButtonTapped(_ sender: Any) {
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignUpController") as? SignUpController else {
//            print("Couldn't find the view controller")
//            return
//        }
//        destinationViewController.modalTransitionStyle = .crossDissolve
//
//        present(destinationViewController, animated: true, completion: nil)
//    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController") as? NavigationController else {
            print("Couldn't find the view controller")
            return
        }
        
        destinationViewController.modalTransitionStyle = .crossDissolve
        present(destinationViewController, animated: true, completion: nil)
    }
    
    func downloadWeatherDetails() {
        let currentWeatherURL = URL(string: CURRENT_NASA_APOD_URL)
        print("Weather url: \(currentWeatherURL?.absoluteString ?? "Error")")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else { return }
        
        geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
            guard let currentLocPlacemark = placemarks?.first else { return }
            print(currentLocPlacemark.country ?? "No country found")
            print(currentLocPlacemark.isoCountryCode ?? "No country code found")
        }
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("Location: \(locValue.latitude) lat & \(locValue.longitude) long")
    }
    
}



func countryName(from countryCode: String) -> String {
    if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
        print("Country name: \(name)")
        return name
    } else {
        print("Country code: \(countryCode)")
        return countryCode
    }
}

public extension UIDevice {
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad11,4", "iPad11,5":                    return "iPad Air (3rd generation)"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad11,1", "iPad11,2":                    return "iPad Mini 5"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()

}

