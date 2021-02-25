//
//  Date.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Foundation

extension Date {
    func timeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"

        let time = "\(dateFormatter.string(from: self)), \(timeFormatter.string(from: self))"

        return time
    }
}
