//
//  ViewController.swift
//  Project36
//
//  Created by 馬丹君 on 2019/7/10.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate{
  var iconView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        view.addSubview(self.coverView)
         self.navigationController?.navigationBar.alpha = 0
        doAnimation()
        
    }
    
    func doAnimation(){
        print("enter do animation")
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1, 0.8, 20]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 1
        animation.delegate = self
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunctions = [CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut), CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeIn)]
        self.iconView.layer.add(animation, forKey: "scale")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.coverView.removeFromSuperview()
        self.navigationController?.isNavigationBarHidden = true
        UIView.animate(withDuration: 0.1, animations: {
            self.navigationController?.isNavigationBarHidden = true
            self.navigationController?.navigationBar.alpha = 1
        }, completion: nil)
    }
    
    lazy var coverView:UIView = {
        var tmpView:UIView = UIView.init(frame: self.view.bounds)
        tmpView.backgroundColor = UIColor.init(red: 93 / 255.0, green: 173 / 255.0, blue: 244 / 255.0, alpha: 1)
        let iconTwitter = UIImageView.init(image: UIImage(named: "twitterIcon"))
        iconTwitter.bounds.size = CGSize(width: 70,height: 60)
        iconTwitter.center = tmpView.center
        tmpView.addSubview(iconTwitter)
        self.iconView = iconTwitter
        return tmpView
    }()
}

