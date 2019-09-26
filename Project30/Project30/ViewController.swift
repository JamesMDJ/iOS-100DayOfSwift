//
//  ViewController.swift
//  Project30
//
//  Created by 馬丹君 on 2019/7/8.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Charts: UIView!
    
    @IBOutlet weak var Featured: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Featured.isHidden = false
        Charts.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func changeType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
         print(index)
        
        switch index{
        case 0:
            Featured.isHidden = false
            Charts.isHidden = true
        case 1:
            Featured.isHidden = true
            Charts.isHidden = false
            
        default:
            Featured.isHidden = false
            Charts.isHidden = true
        }
        print(sender.titleForSegment(at: index)!)
    }
    

}

