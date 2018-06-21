//
//  MainViewController.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var bellowSatusBarView: UIView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    @IBOutlet weak var bottomMargin: NSLayoutConstraint!
    
    weak var mainNC: MainNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)),name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)),name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo! as NSDictionary
        let keyboardFrame = userInfo.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        bottomMargin.constant = -keyboardHeight
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        bottomMargin.constant = 0
        self.view.layoutIfNeeded()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if
            segue.identifier == "mainNC",
            segue.source == self,
            let mainNC = segue.destination as? MainNavigationController
        {
            self.mainNC = mainNC
            
            if let vc = UIStoryboard(name: "Start", bundle: nil).instantiateInitialViewController() {
                self.mainNC?.pushViewController(vc, animated: false)
            }
        }
    }
    
    func set(top bars: [AnyBarView]) {
        set(bars: bars, for: self.topStackView)
    }
    
    func set(bottom bars: [AnyBarView] = []) {
        set(bars: bars, for: self.bottomStackView)
    }
    
    private func set(bars: [AnyBarView], for stackView: UIStackView) {
        var bars: [AnyBarView] = [AnyBarView](bars)
        if stackView == self.bottomStackView {
            bars = bars.reversed()
        }
        bars.insert(Bar<EmptyBarView>(), at: 0)
        
        func insert(view: UIView, at index: Int) {
            view.alpha = 0
            view.isHidden = true
            stackView.insertArrangedSubview(view, at: index)
            UIView.animate(withDuration: 0.25) {
                view.alpha = 1
                view.isHidden = false
            }
        }
        
        func remove(view: UIView) {
            UIView.animate(withDuration: 0.25, animations: {
                view.alpha = 0
                view.isHidden = true
            }, completion: { [weak stackView] _ in
                stackView?.removeArrangedSubview(view)
                view.removeFromSuperview()
            })
        }
        
        for index in 0..<max(bars.count, stackView.arrangedSubviews.count) {
            let bar = index < bars.count ? bars[index] : nil
            let view = index < stackView.arrangedSubviews.count ? stackView.arrangedSubviews.first(where: { $0.tag == index }) : nil
            
            if
                let bar = bar
            {
                if let view = view as? BarView {
                    if NSStringFromClass(bar.clazz()) == NSStringFromClass(type(of: view)) {
                        bar.viewWillAppear(view)
                    } else {
                        if
                            let newView = bar.clazz().fromNib() as? BarView
                        {
                            newView.tag = index
                            bar.viewWillAppear(newView)
                            remove(view: view)
                            insert(view: newView, at: index)
                        } else {
                            remove(view: view)
                        }
                    }
                } else {
                    if
                        let newView = bar.clazz().fromNib() as? BarView
                    {
                        newView.tag = index
                        bar.viewWillAppear(newView)
                        insert(view: newView, at: index)
                    }
                }
            } else if let view = view {
                remove(view: view)
            }
        }
    }
}

