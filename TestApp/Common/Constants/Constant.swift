//
//  Constant.swift
//  TestApp
//
//  Created by Shamil on 17.05.2022.
//

import UIKit

struct Constant {
    static let screenBounds = UIScreen.main.bounds
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let isSmalliPhone =  UIScreen.main.bounds.height < 750
    static let isThiniPhone =  UIScreen.main.bounds.width < 375
    static let leadingButtonOffset = 17
}
