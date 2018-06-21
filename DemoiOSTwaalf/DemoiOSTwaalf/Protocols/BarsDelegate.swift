//
//  BarsDelegate.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

protocol BarsDelegate {
    typealias Defaults = (top: [AnyBarView], bottom: [AnyBarView], statusBarColor: UIColor)
    
    func top() -> [AnyBarView]
    func bottom() -> [AnyBarView]
    func statusBarColor() -> UIColor
}

extension BarsDelegate where Self: UIViewController {
    func top() -> [AnyBarView] { return defaults.top }
    func bottom() -> [AnyBarView] { return defaults.bottom }
    func statusBarColor() -> UIColor { return defaults.statusBarColor }
    
    private var defaults: BarsDefaults {
        return BarsDefaults(for: self)
    }
}

class BarsDefaults {
    let top: [AnyBarView]
    let bottom: [AnyBarView]
    let statusBarColor: UIColor
    
    init(for viewController: UIViewController) {
        top = [
            Bar<TitleBarView>() {
                $0.name = viewController.title ?? ""
            }
        ]
        
        bottom = []
        
        statusBarColor = .clear
    }
}

