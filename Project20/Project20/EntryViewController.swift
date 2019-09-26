//
//  EntryViewController.swift
//  Project20
//
//  Created by 馬丹君 on 2019/7/3.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class EntryViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, CLLocationManagerDelegate{

    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet weak var dateLabel: UILabel!
   
    @IBOutlet weak var showLocation: UIBarButtonItem!
    
    @IBOutlet weak var textDescript: UITextField!
    

    let app = UIApplication.shared.delegate as! AppDelegate
    var viewContext : NSManagedObjectContext!
    
    
    let locationManager = CLLocationManager()
    var image:UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContext = app.persistentContainer.viewContext
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MMMM dd,YYYY 'at' HH:mm a"
        let date = dateformatter.string(from: Date())
        dateLabel.text = date
        // Do any additional setup after loading the view.
        
        for tmp in view.subviews{
            if tmp is UITextField{
                (tmp as! UITextField).inputAccessoryView = toolbar
            }
        }
        //TODO:Set up the location manager here.
        locationManager.delegate = self  //宣告自己 (current VC)為 locationManager 的代理
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters //定位所在地的精確程度(一般來說，精準程度越高，定位時間越長，所耗費的電力也因此更多)
        //to ask the user for location
        locationManager.requestWhenInUseAuthorization()  //for not destroying the user's battery
    
    }
    

    @IBAction func doneOnClick(_ sender: Any) {
        
        insertUserData()
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "timeLine") {
             self.navigationController?.pushViewController(controller, animated: true)
        }
        //insertUserData1()
    }
    
    func insertUserData(){
        let timeLine = NSEntityDescription.insertNewObject(forEntityName: "TimelineEntity", into: viewContext) as! TimelineEntity
        timeLine.dateTime = Date()
        timeLine.descript = "\(textDescript.text!)"
        timeLine.id = "1"
        timeLine.location = self.showLocation.title
        timeLine.photo = image!.pngData()
       // timeLine.photo = UIImage(named: "2")!.pngData()
        app.saveContext()
    }
    
    func insertUserData1(){
        var timeLine = NSEntityDescription.insertNewObject(forEntityName: "TimelineEntity", into: viewContext) as! TimelineEntity
        timeLine.dateTime = Date()
        timeLine.descript = "Subqueries (also known as inner queries or nested queries) are a tool for performing operations in multiple steps. For example, if you wanted to take the sums of several columns, then average all of those values, you’d need to do each aggregation in a distinct step."
        timeLine.id = "1"
        timeLine.location = "TW"
        timeLine.photo = UIImage(named: "2")!.pngData()
        
        app.saveContext()
    }
    @IBAction func getPictureOnClick(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePickerVC.modalPresentationStyle = .fullScreen
        show(imagePickerVC, sender: sender)
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
//                     print(placemark.name)
//                     print(placemark.country)
//                     print(placemark.locality)
//                     print(placemark.administrativeArea)
                    self.showLocation.title = "\(placemark.locality!) "
                    self.showLocation.isEnabled = false
                }
            }
        }
    }

    
    @IBAction func getLocationOnClick(_ sender: Any) {
        print("location")
        locationManager.startUpdatingLocation()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        let imageView = UIImageView(image: image)
        let screenSize = UIScreen.main.bounds.size
        imageView.frame = CGRect(x: screenSize.width-50, y: 5, width: 45, height: 35)
        toolbar.addSubview(imageView)
        dismiss(animated: true, completion: nil)
        
    }
}
