//
//  PushAnimator.swift
//  GeekVK
//
//  Created by Антон Данилов on 22.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let duration: TimeInterval = 0.8
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let src = transitionContext.viewController(forKey: .from),
            let dst = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(dst.view)
        
        src.view.frame = transitionContext.containerView.frame
        dst.view.frame = transitionContext.containerView.frame
        
        dst.view.transform = CGAffineTransform(translationX: dst.view.frame.width,y: dst.view.frame.width)
            .rotated(by: -90)
            .translatedBy(x: -dst.view.frame.width,y: dst.view.frame.width)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.75, animations: {
                let t = CGAffineTransform(translationX: -src.view.frame.width, y: -src.view.frame.width)
                src.view.transform = t
                    .rotated(by: 90)
                    .translatedBy(x: src.view.frame.width, y: src.view.frame.width)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: {
                dst.view.transform = .identity
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                src.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
