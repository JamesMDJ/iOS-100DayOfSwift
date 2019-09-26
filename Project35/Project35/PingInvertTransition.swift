//
//  PingInvertTransition.swift
//  Project35
//
//  Created by 馬丹君 on 2019/7/9.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class PingInvertTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        self.transitionContext = transitionContext
        
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! SpeakViewController
        
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        
        let containerView =  transitionContext.containerView
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(fromVC.view)
        
        let speakOutBtn = fromVC.speakButton
        
        let radius = sqrt((toVC.view.frame.size.width * toVC.view.frame.size.width) + ((speakOutBtn?.center.y)! * speakOutBtn!.center.y))
        
        let maskStartBP = UIBezierPath.init(arcCenter: speakOutBtn!.center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let maskFinalBP = UIBezierPath.init(ovalIn: toVC.btn.frame)
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = maskFinalBP.cgPath
        
        fromVC.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation.init(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.cgPath
        maskLayerAnimation.toValue = maskFinalBP.cgPath
        maskLayerAnimation.duration = self.transitionDuration(using: transitionContext)
        maskLayerAnimation.delegate = self as! CAAnimationDelegate;
        maskLayer.add(maskLayerAnimation, forKey: "pingInvert")
        
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext)) {
            var fromBtnF = speakOutBtn!.frame
            fromBtnF.origin.y = speakOutBtn!.frame.origin.y - 50
            speakOutBtn!.frame = fromBtnF
            
            //            var toBtnF = toVC.speakButton.frame
            //            toBtnF.origin.y = toVC.speakButton.frame.origin.y + 200
            //            toVC.speakButton.frame = fromBtnF
        }
    }
    
    
    var transitionContext: UIViewControllerContextTransitioning!
}
