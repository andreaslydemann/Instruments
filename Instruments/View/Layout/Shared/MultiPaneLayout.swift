//
//  MultiPaneLayout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import CoreGraphics

struct MultiPaneLayout<ChildContent: Layout, Accessory: Layout>: Layout where ChildContent.Content == Accessory.Content {
    
    typealias Content = ChildContent.Content
    
    private var composedLayout: DecoratingLayout<ChildContent, CascadingLayout<Accessory>>
    
    init(content: ChildContent, accessories: [Accessory]) {
        let decoration = CascadingLayout(children: accessories)
        composedLayout = DecoratingLayout(content: content, decoration: decoration)
    }
    
    mutating func layout(in rect: CGRect) {
        composedLayout.layout(in: rect)
    }
    
    var contents: [ChildContent.Content] {
        return composedLayout.contents
    }
}
