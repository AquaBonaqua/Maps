//
//  ViewController.swift
//  MapsShitov
//
//  Created by WSR on 10.02.2021.
//

import UIKit
import CoreLocation

class LocationVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var dataLat: UILabel!
    @IBOutlet weak var dataLon: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuthorization()
        // Do any additional setup after loading the view.
    }

    
    func checkAuthorization()   {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            print("error")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
            if let location = locations.last?.coordinate { dataLat.text = String( location.latitude)
                dataLon.text = String(location.longitude)
                locationManager.stopUpdatingLocation()
            }
        }
        

}


