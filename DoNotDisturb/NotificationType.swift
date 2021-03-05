//
//  NotificationType.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Foundation

public struct NotificationType {
    var id: String = ""
    var speech: String = ""
    var timestamp: Date?
    var audioFile: String = ""
    var imageName: String = ""
}

struct DoNotDisturbNotifications {
    static let typesOfNotifications = [
        NotificationType(id: "0",
                              speech: "Please Do Not Make Any Noise.",
                              audioFile: "PleaseDoNotMakeAnyNoise"),
        NotificationType(id: "1",
                              speech: "Please Be Quiet.",
                              audioFile: "PleaseBeQuiet"),
        NotificationType(id: "2",
                              speech: "Do Not Disturb Do Not Disturb Do Not Disturb",
                              audioFile: "DoNotDisturb")
    ]

    func randomDoNotDisturbNotification() -> NotificationType {
        let random = Int.random(in: 0..<DoNotDisturbNotifications.typesOfNotifications.count)
        return DoNotDisturbNotifications.typesOfNotifications[random]
    }
}
