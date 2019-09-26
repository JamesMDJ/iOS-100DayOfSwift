//
//  PingTransition.swift
//  Project35
//
//  Created by 馬丹君 on 2019/7/9.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

class PingTransition: NSObject, UIViewControllerAnimatedTransitioning{
        var transitionContext: UIViewControllerContextTransitioning!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let viewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SpeakViewController
        let contentView = transitionContext.containerView
        let speakbtn = viewController.btn
        contentView.addSubview(toVC.view)
        let maskStartBP = UIBezierPath.init(ovalIn: speakbtn!.frame)
        
        let radius = sqrt((toVC.view.frame.size.width * toVC.view.frame.size.width) + ((speakbtn?.center.y)! * (speakbtn?.center.y)!))
        let maskFinalBP = UIBezierPath.init(arcCenter: speakbtn!.center, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskFinalBP.cgPath;
        toVC.view.layer.mask = maskLayer;
        
        let maskLayerAnimation = CABasicAnimation.init(keyPath: "path")
        maskLayerAnimation.fromValue = maskStartBP.cgPath
        maskLayerAnimation.toValue = maskFinalBP.cgPath
        maskLayerAnimation.duration = self.transitionDuration(using: transitionContext)
        maskLayerAnimation.delegate = self as! CAAnimationDelegate;
        maskLayer.add(maskLayerAnimation, forKey: "path")
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext)) {
            var toBtnF = toVC.speakButton.frame
            toBtnF.origin.y = toVC.speakButton.frame.origin.y + 50
            toVC.speakButton.frame = toBtnF
            //
            //            var fromBtnF = speakBtn.frame
            //            fromBtnF.origin.y = speakBtn.frame.origin.y - 50
            //            speakBtn.frame = fromBtnF
        }
        
    }
    
    
     func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext.completeTransition(!self.transitionContext.transitionWasCancelled)
        self.transitionContext.viewController(forKey: UITransitionContextViewControllerKey(rawValue: "UITransitionContextFromViewControllerKey"))?.view.layer.mask = nil
        self.transitionContext.viewController(forKey: UITransitionContextViewControllerKey(rawValue: "UITransitionContextToViewControllerKey"))?.view.layer.mask = nil
    }

   
}
