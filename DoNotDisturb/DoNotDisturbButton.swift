//
//  DoNotDisturbButton.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Foundation
import UIKit

class DoNotDisturbButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    convenience init(title: String, backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
    }

    func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .white
        titleLabel?.font = .boldSystemFont(ofSize: 72)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.width

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
