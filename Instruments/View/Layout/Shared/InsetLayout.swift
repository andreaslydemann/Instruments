//
//  InsetLayout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

struct InsetLayout<Child: Layout>: Layout {
    
    typealias Content = Child.Content
    
    var child: Child
    
    var insets: UIEdgeInsets
    
    fileprivate init(child: Child, insets: UIEdgeInsets) {
        self.child = child
        self.insets = insets
    }
    
    mutating func layout(in rect: CGRect) {
        let rect = rect.inset(by: insets)
        
        child.layout(in: rect)
    }
    
    var contents: [Child.Content] {
        return child.contents
    }
}

extension Layout {
    func withInsets(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> InsetLayout<Self> {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        
        return withInsets(insets)
    }

    func withInsets(all insets: CGFloat) -> InsetLayout<Self> {
        return withInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    func withInsets(_ insets: UIEdgeInsets) -> InsetLayout<Self> {
        return InsetLayout(child: self, insets: insets)
    }
}
