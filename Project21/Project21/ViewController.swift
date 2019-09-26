//
//  ViewController.swift
//  Project21
//
//  Created by 馬丹君 on 2019/7/4.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self  //宣告自己 (current VC)為 locationManager 的代理
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //定位所在地的精確程度(一般來說，精準程度越高，定位時間越長，所耗費的電力也因此更多)
    

    }

    @IBAction func refreshLocationOnClick(_ sender: Any) {
         locationManager.requestWhenInUseAuthorization()  //for not destroying the user's battery
        locationManager.startUpdatingLocation()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        //由於我們的 "startUpdatingLocation()" 會回傳一個陣列的 CLLocation ，而最後回傳的會是最接近於我們當前位置的 CLLocation 。 因此我們要娶的就是這個 CLLocation
        let location = locations[locations.count - 1]  //the method "startUpdatingLocation()" is gonna grab a set of locations that are getting more & more accurate. So we'd want the last location in this array
        //簡單檢查一下取得的值
        if location.horizontalAccuracy > 0 {  //this line will check if the location is available
            // 由於定位功能十分耗電，我們既然已經取得了位置，就該速速把它關掉
            locationManager.stopUpdatingLocation()
            print("latitude: \(location.coordinate.latitude), longtitude: \(location.coordinate.longitude)")
            
            let location = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                guard error ==  nil,placemarks != nil else{
                    return
                }
                for placemark in placemarks!{
//                    print(placemark.name)
//                    print(placemark.country)
//                    print(placemark.locality)
//                    print(placemark.administrativeArea)
                    self.locationLabel.text = "\(placemark.locality!) \(placemark.administrativeArea!) \(placemark.name!) \(placemark.country!)"
                }
            }
            
            

        }
    }

    
}

