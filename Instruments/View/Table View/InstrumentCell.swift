//
//  InstrumentCell.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 16/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class InstrumentCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        
    }
}
