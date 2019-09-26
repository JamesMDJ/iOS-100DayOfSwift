//
//  ViewController.swift
//  Project23
//
//  Created by 馬丹君 on 2019/7/4.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var dateLabel: UILabel!
    var textDate:String = "Date"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateLabel.text = textDate
    }


}

