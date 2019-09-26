//
//  ViewController2.swift
//  Project37-1
//
//  Created by 馬丹君 on 2019/7/11.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UINavigationControllerDelegate{
 var selectedPoke: UIImage!
    private var percentDrivenTransition: UIPercentDrivenInteractiveTransition?

    @IBOutlet weak var v2ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        self.selectedPoke = v2ImageView.image
        // Do any additional setup after loading the view.
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationController.Operation.pop {
            let vc = CustomTransition()
            vc.type = Type.POP
             return vc
        }else{
            return nil
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is CustomTransition {
            return self.percentDrivenTransition
        } else {
            return nil
        }
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
