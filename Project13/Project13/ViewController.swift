//
//  ViewController.swift
//  Project13
//
//  Created by 馬丹君 on 2019/7/1.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dictCity: [String:String]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        dictCity!["The Philippines"] = "菲律賓"
        dictCity!["Manila"] = "馬尼拉"
        dictCity!["Singapore"] = "新加坡"
        dictCity!["Thailand"] = "泰國"
        dictCity!["Bangkok"] = "曼谷"
       
        // Do any additional setup after loading the view.
    }


}

