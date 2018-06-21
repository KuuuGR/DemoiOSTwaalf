//
//  TitleBarView.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class TitleBarView: BarView {
    
    enum ButtonAction {
        case none, done, skip
    }
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var name: String? {
        didSet {
            //       nameLabel.addFadeAnimation()
            nameLabel.text = name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowRadius = 7
        shadowView.layer.shadowOpacity = 1
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        UIApplication.mainNC?.popViewController(animated: true)
    }
    
    override func viewWillAppear() {
        if UIApplication.mainNC?.viewControllers.count ?? 0 > 1 {
            self.backButton.isHidden = false
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.backButton.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.backButton.alpha = 0
                }, completion: {  [weak self] (success) in
                    self?.backButton.isHidden = true
            })
        }
    }
}

