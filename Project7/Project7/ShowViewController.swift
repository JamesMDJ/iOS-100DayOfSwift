//
//  ShowViewController.swift
//  Project7
//
//  Created by 馬丹君 on 2019/6/29.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet weak var showLabel: UILabel!
    var showData:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let showData = showData{
            showLabel.text = showData
        }
        
        // Do any additional setup after loading the view.
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
