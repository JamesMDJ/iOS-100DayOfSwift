//
//  ViewController.swift
//  Project35
//
//  Created by 馬丹君 on 2019/7/9.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
 var diffustionTransition:PingTransition!
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.delegate = self as! UINavigationControllerDelegate
       
    }

    @IBAction func speakOnCliick(_ sender: Any) {
        print("w")
      
        self.navigationController?.pushViewController(SpeakViewController(), animated: true)
        
    }
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PingTransition()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PingInvertTransition()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let speakVC = segue.destination as! SpeakViewController
        speakVC.transitioningDelegate = self
    }
}

