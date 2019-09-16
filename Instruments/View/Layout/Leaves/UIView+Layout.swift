//
//  UIView+Layout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

extension UIView: Layout {
    typealias Content = UIView
    
    func layout(in rect: CGRect) {
        self.frame = rect
    }
    
    var contents: [Content] {
        return [self]
    }
}
