//
//  MainNavigationController.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.view.addObserver(self, forKeyPath: "frame", options: .new, context: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            self.viewControllers.forEach({ vc in
                UIView.animate(withDuration: 0.25, animations: {
                    vc.view.frame = self.view.bounds
                })
            })
        }
    }
    
    @discardableResult
    override func popViewController(animated: Bool) -> UIViewController? {
        let controls: [UIControl] = findViews(in: self.viewControllers.last?.view.subviews)
        for control in controls {
            if control.isFirstResponder {
                control.resignFirstResponder()
                //                break
            }
        }
        return super.popViewController(animated: animated)
    }
}

extension MainNavigationController: UINavigationControllerDelegate {
    private static let animator = Animator()
    
    private class Animator: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 0.25
        }
        
        func animateTransition(using context: UIViewControllerContextTransitioning) {
            if let toVC = context.viewController(forKey: .to) {
                context.containerView.addSubview(toVC.view)
                toVC.view.alpha = 0
                
                UIView.animate(withDuration: transitionDuration(using: context), animations: {
                    toVC.view.alpha = 1
                }, completion: { _ in
                    context.completeTransition(!context.transitionWasCancelled)
                })
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MainNavigationController.animator
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let barsDelegate = viewController as? BarsDelegate
        let barsDefaults = BarsDefaults(for: viewController)
        
        let top = barsDelegate?.top() ?? barsDefaults.top
        let bottom = barsDelegate?.bottom() ?? barsDefaults.bottom
        let statusBarColor = barsDelegate?.statusBarColor() ?? barsDefaults.statusBarColor
        
        UIApplication.mainVC?.set(top: top)
        UIApplication.mainVC?.set(bottom: bottom)
        UIApplication.mainVC?.bellowSatusBarView.backgroundColor = statusBarColor
    }
}

