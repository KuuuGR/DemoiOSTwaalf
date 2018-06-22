//
//  ARVC.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//


import UIKit

class ARVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}


extension ARVC: BarsDelegate {
    func top() -> [AnyBarView] {
        return [
            Bar<TitleBarView>() {
                $0.name = "Augmented Reality"
                $0.mainView.backgroundColor = UIColor.dGreen
                $0.nameLabel.textColor = UIColor.dBlack
            }
        ]
    }
}
//extension StartViewController: BarsDelegate {
//    func top() -> [AnyBarView] {
//        return []
//    }
//}

