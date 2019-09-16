//
//  DecoratingLayout.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import CoreGraphics

struct DecoratingLayout<ChildContent: Layout, Decoration: Layout>: Layout where ChildContent.Content == Decoration.Content {
    
    typealias Content = ChildContent.Content
    
    var content: InsetLayout<ChildContent>
    var decoration: InsetLayout<Decoration>
    
    init(content: ChildContent, decoration: Decoration) {
        self.content = content.withInsets(all: 5)
        self.decoration = decoration.withInsets(top: 5, bottom: 5, right: 5)
    }
    
    mutating func layout(in rect: CGRect) {
        let contentRect = self.contentRect(in: rect)
        let decorationRect = self.decorationRect(in: rect)
        
        content.layout(in: contentRect)
        decoration.layout(in: decorationRect)
    }
    
    func contentRect(in rect: CGRect) -> CGRect {
        var dstRect = rect
        dstRect.origin.x = rect.size.width / 3
        dstRect.size.width *= 2/3
        return dstRect
    }
    
    func decorationRect(in rect: CGRect) -> CGRect {
        var dstRect = rect
        dstRect.size.width /= 3
        return dstRect
    }
    
    var contents: [ChildContent.Content] {
        return decoration.contents + content.contents
    }
}
