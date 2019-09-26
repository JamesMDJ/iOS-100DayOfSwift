//
//  ViewController.swift
//  Project22
//
//  Created by 馬丹君 on 2019/7/4.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var dateTitle:String = "Date"
    
    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd,YYYY"
        dateTitle = dateFormatter.string(from: sender.date)
        
        
    }
    @IBAction func setDateOnClick(_ sender: Any) {
        navigationItemTitle.title = dateTitle
    }
    
}

