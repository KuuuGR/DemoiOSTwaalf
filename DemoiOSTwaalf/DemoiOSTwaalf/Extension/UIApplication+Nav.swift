//
//  UIApplication+Nav.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

extension UIApplication {
    class var mainVC: MainViewController? {
        get { return UIApplication.shared.keyWindow?.rootViewController as? MainViewController }
        set {}
    }
    
    class var mainNC: MainNavigationController? {
        get { return mainVC?.mainNC }
        set {}
    }
}
