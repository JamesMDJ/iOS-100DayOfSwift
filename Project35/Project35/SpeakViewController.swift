//
//  SpeakViewController.swift
//  Project35
//
//  Created by 馬丹君 on 2019/7/9.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class SpeakViewController: UIViewController {

    @IBOutlet weak var speakButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
