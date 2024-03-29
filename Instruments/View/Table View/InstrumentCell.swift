//
//  InstrumentCell.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class InstrumentCell: UITableViewCell {
    
    static let reuseIdentifier = "\(InstrumentCell.self)"
    
    var content = UILabel()
    var accessories = [UIImageView]()
    
    var instrument: Instrument! {
        didSet {
            accessories = (0..<instrument.numberOfInstruments).map { _ in
                let imageView = UIImageView(image: instrument.instrumentOption.image)
                imageView.contentMode = .scaleAspectFit
                return imageView
            }
            content.text = instrument.description
            for subview in contentView.subviews {
                subview.removeFromSuperview()
            }
            addSubviews()
            setNeedsLayout()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        let multiPaneLayout = MultiPaneLayout(content: content, accessories: accessories)
        for view in multiPaneLayout.contents {
            contentView.addSubview(view)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var multiPaneLayout = MultiPaneLayout(content: content, accessories: accessories)
        multiPaneLayout.layout(in: contentView.bounds)
    }
}
