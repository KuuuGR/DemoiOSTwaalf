//
//  Utils.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

func className(_ clazz: AnyClass) -> String {
    var className = NSStringFromClass(clazz)
    if let dot = className.index(of: ".") {
        className.replaceSubrange(...dot, with: "")
    }
    return className
}

private let normalWidth: CGFloat = 375
func scale(value: CGFloat) -> CGFloat {
    return UIScreen.main.bounds.width / normalWidth * value
}

func findViews<T:UIView>(in subviews: [UIView]?) -> [T] {
    var views = [T]()
    for subview in subviews ?? [] {
        if subview is T {
            views.append(subview as! T)
        }
        views.append(contentsOf: findViews(in: subview.subviews) as! [T])
    }
    return views
}

func onMain(completion: @escaping () -> ()) {
    if Thread.isMainThread {
        completion()
    } else {
        DispatchQueue.main.async {
            completion()
        }
    }
}
