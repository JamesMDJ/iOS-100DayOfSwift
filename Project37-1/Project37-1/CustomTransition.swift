//
//  CustomTransition.swift
//  Project37-1
//
//  Created by 馬丹君 on 2019/7/11.
//  Copyright © 2019 MaJ. All rights reserved.
//

import UIKit

enum Type{
   case PUSH
   case POP
}

class CustomTransition: NSObject,UIViewControllerAnimatedTransitioning{
    
    let screen = UIScreen.main.bounds
    var type:Type? = .POP
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if self.type == Type.PUSH{
            print("PUSH")
            let fromVC = transitionContext.viewController(forKey: .from) as! ViewController
            let toVC = transitionContext.viewController(forKey: .to) as! ViewController2
            let containerView = transitionContext.containerView
            
            let snapView = fromVC.TImageView
            let snapFrame = containerView.convert(fromVC.TImageView.frame, from: fromVC.view)
            snapView!.frame = snapFrame
            toVC.view.frame = transitionContext.finalFrame(for: toVC)
            toVC.v2ImageView.alpha = 0
         //   fromVC.selectIV!.isHidden = true
            containerView.addSubview(toVC.view)
            containerView.addSubview(snapView!)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options:.curveEaseIn, animations: {
                snapView!.frame = CGRect(x: 0, y: (self.screen.height - self.screen.width) / 2, width: self.screen.width, height: self.screen.width)
                toVC.v2ImageView.alpha = 1
            }, completion: { (true) in
                snapView!.removeFromSuperview()//昨天加边缘手势一直有问题, 原来是这里的图片没移除, 坑
                //                    fromVC.selectedCell.hidden = false 这里可以pop动画的时候再设置显示true
                toVC.v2ImageView.image = fromVC.TImageView.imageView?.image
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }
        if self.type == Type.POP{
            print("POP")
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController2
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
            let cotainerView = transitionContext.containerView
            fromVC.v2ImageView.isHidden = true
            let snapView = fromVC.v2ImageView.snapshotView(afterScreenUpdates: false)
            let snapFrame = cotainerView.convert(fromVC.view.frame, from: fromVC.view)
            snapView?.frame = snapFrame
            toVC.view.frame = transitionContext.finalFrame(for: toVC)
            toVC.view.alpha = 0.5
            cotainerView.addSubview(toVC.view)
            cotainerView.addSubview(snapView!)
            let finalFrame = cotainerView.convert(toVC.selectIV!.frame, from: toVC.selectIV)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: .curveEaseInOut, animations: {
                snapView!.frame = finalFrame
                toVC.view.alpha = 1.0
            }, completion: { (true) in
                toVC.selectIV!.isHidden = false//37行 之前隐藏了   现在显示
           //     fromVC.v2ImageView.isHidden = false
                snapView!.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
    

}
