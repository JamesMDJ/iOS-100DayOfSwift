//
//  ViewController.swift
//  Project7
//
//  Created by 馬丹君 on 2019/6/29.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seque_vc_to_next"{
            let vc = segue.destination as! ShowViewController
            vc.showData = editTextField.text
        }
    }

}

