//
//  Layout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import CoreGraphics

protocol Layout {
    mutating func layout(in rect: CGRect)
    
    associatedtype Content
    
    var contents: [Content] { get }
}
