//
//  ViewController.swift
//  Project8
//
//  Created by 馬丹君 on 2019/6/29.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func swipeDownDismissKeyboard(_ sender: UISwipeGestureRecognizer) {
        view.endEditing(true)
    }
    
}

