//
//  DismissionAnimation.swift
//  Test
//
//  Created by Adrian Coroian on 6/12/18.
//  Copyright © 2018 Adrian Coroian. All rights reserved.
//

import Foundation

import UIKit

internal class DismissStoryViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    internal var selectedCardFrame: CGRect = .zero
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 1
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? DetailViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? StoryFeed else {
                return
        }
        
        // 2
        toViewController.view.isHidden = true
        containerView.addSubview(toViewController.view)
        
        // 3
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration,
                       delay:0.0,
                       usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0,
                       animations: {
                        fromViewController.positionContainer(left: 20.0,
                                                             right: 20.0,
                                                             top: self.selectedCardFrame.origin.y + 30.0,
                                                             bottom: 0.0)
                        fromViewController.setHeaderHeight(self.selectedCardFrame.size.height - 40.0)
                        fromViewController.configureRoundedCorners(shouldRound: true)
        }) { (_) in
            toViewController.view.isHidden = false
            fromViewController.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
}
