//
//  Bar.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

protocol AnyBarView {
    func clazz() -> BarView.Type
    func viewWillAppear(_ view: BarView)
}

class Bar<T:BarView>: AnyBarView {
    typealias Action = (T) -> ()
    
    var _viewWillAppear: Action?
    
    init(viewWillAppear: Action? = nil) {
        _viewWillAppear = viewWillAppear
    }
    
    func clazz() -> BarView.Type {
        return T.self
    }
    
    func viewWillAppear(_ view: BarView) {
        if let _view = view as? T {
            _viewWillAppear?(_view)
            _view.viewWillAppear()
        }
    }
    
}
