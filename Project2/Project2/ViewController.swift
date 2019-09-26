//
//  ViewController.swift
//  Project2
//
//  Created by 馬丹君 on 2019/6/27.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count:Int = 0
    
    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickReset(_ sender: Any) {
        count = 0
        labelResult.text = String(count)
    }
    
 
    @IBAction func tapped(_ sender: Any) {
        count += 1
        labelResult.text = String(count)
    }
    
    @IBAction func longPressed(_ sender: Any) {
        count += 1
        labelResult.text = String(count)
    }
}

