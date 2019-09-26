//
//  ViewController.swift
//  Project19
//
//  Created by 馬丹君 on 2019/7/3.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for tmp in view.subviews{
            if tmp is UIStackView{
                for stackView in tmp.subviews{
                    if stackView is UITextField{
                         (stackView as! UITextField).inputAccessoryView = toolbar
                    }
                }
            }
        }
        
        let formmatter = DateFormatter()
        formmatter.dateFormat = "MMMM d,YYYY"
        let date = formmatter.string(from: Date())
        dateLabel.text = String(date)
        
        
        
    }


}

