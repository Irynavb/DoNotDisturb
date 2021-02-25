//
//  DoNotDisturbButton.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Foundation
import UIKit

class DoNotDisturbButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.systemRed : UIColor.systemTeal
        }
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width
    }
}
