//
//  CascadingLayout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import CoreGraphics

struct CascadingLayout<Child: Layout>: Layout {
    typealias Content = Child.Content
    
    var children: [Child]
    var overlapFactor: CGFloat
    
    init(children: [Child], overlapFactor: CGFloat = 0.2) {
        self.children = children
        self.overlapFactor = overlapFactor
    }
    
    mutating func layout(in rect: CGRect) {
        let childSizeFactor = 1.0 / (1.0 + overlapFactor * CGFloat(children.count - 1))
        var childRect = rect
        childRect.size.width *= childSizeFactor
        childRect.size.height *= childSizeFactor
        for index in children.indices {
            children[index].layout(in: childRect)
            childRect.origin.x += childRect.size.width * overlapFactor
            childRect.origin.y += childRect.size.height * overlapFactor
        }
    }
    
    var contents: [Child.Content] {
        return children.flatMap { $0.contents }
    }
}
