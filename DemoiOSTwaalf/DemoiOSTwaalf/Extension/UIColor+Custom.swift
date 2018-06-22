//
//  File.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

protocol DummyUIColorCustom {}
extension UIColor: DummyUIColorCustom {
    
    static let dWhite = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    static let dBlack = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let dBlue = #colorLiteral(red: 0.5490196078, green: 0.8078431373, blue: 0.9843137255, alpha: 1)
    static let dRed = #colorLiteral(red: 1, green: 0.4901960784, blue: 0.5529411765, alpha: 1)
    static let dPink = #colorLiteral(red: 0.9607843137, green: 0.7607843137, blue: 1, alpha: 1)
    static let dGreen = #colorLiteral(red: 0.7411764706, green: 1, blue: 0.4784313725, alpha: 1)
    static let dYellow = #colorLiteral(red: 1, green: 0.968627451, blue: 0.5960784314, alpha: 1)
    static let dOrange = #colorLiteral(red: 0.9607843137, green: 0.6509803922, blue: 0.137254902, alpha: 1)
    
}
