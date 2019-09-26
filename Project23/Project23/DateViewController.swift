//
//  DateViewController.swift
//  Project23
//
//  Created by 馬丹君 on 2019/7/4.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    var date:String? = nil
    var time:String? = nil
    @IBOutlet weak var nowLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,YYYY"
        nowLabel.text = dateFormatter.string(from: Date())
        
    }
    
    @IBAction func dateValueChange(_ sender: UIDatePicker) {
        
        print(sender.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,YYYY"
        date = "\(dateFormatter.string(from: sender.date))"
        
    }
    
    @IBAction func timeValueChange(_ sender: UIDatePicker) {
        
        print(sender.date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        time = "\(dateFormatter.string(from: sender.date))"
        
    }
    
    @IBAction func doneOnClick(_ sender: Any) {
    
        
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "main") as? ViewController {
       
           // vc.dateLabel.text = String("s")
            vc.textDate = "\(date!) \(time!)"
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
