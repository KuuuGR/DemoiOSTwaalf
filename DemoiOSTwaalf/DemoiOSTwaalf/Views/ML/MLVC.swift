//
//  MLVC.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class MLVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func imageMainingAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "ImageMaining", bundle: nil).instantiateInitialViewController() {
            UIApplication.mainNC?.pushViewController(vc, animated: false)
        }
    }
    
    @IBAction func textMaining(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "TextMaining", bundle: nil).instantiateInitialViewController() {
            UIApplication.mainNC?.pushViewController(vc, animated: false)
        }
    }
    
    
    @IBAction func othersMLAction(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "OthersML", bundle: nil).instantiateInitialViewController() {
            UIApplication.mainNC?.pushViewController(vc, animated: false)
        }
    }

    

    
}


extension MLVC: BarsDelegate {
    func top() -> [AnyBarView] {
        return [
            Bar<TitleBarView>() {
                $0.name = "Machine Learning"
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
