//
//  ViewController.swift
//  Project37-1
//
//  Created by 馬丹君 on 2019/7/11.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var TImageView: UIButton!
    var selectIV:UIImageView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.delegate = self
       
        TImageView.imageView?.image = UIImage(named: "1")
        
    }

    @IBAction func onClick(_ sender: Any) {
        selectIV = TImageView.imageView
        let vc = storyboard?.instantiateViewController(withIdentifier: "V2") as! ViewController2
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let customTransition = CustomTransition()
        customTransition.type = Type.PUSH
        return customTransition
    }
    
}

