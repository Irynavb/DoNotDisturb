//
//  Manager.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Foundation
import Firebase

struct DoNotDisturbRequest: Identifiable {
    var id: String
    var notificationType: NotificationType?
    var timestamp: Date?
}

class Manager: NSObject, ObservableObject {
    @Published var doNotDisturbRequests = [DoNotDisturbRequest]()

    override init() {
        super.init()

        var ref: DatabaseReference!
        ref = Database.database().reference()

        ref.observe(.childAdded) { (snapshot) in
            for request in snapshot.children {
                print(request)
                if let request = request as? DataSnapshot, let value = request.value, let data = value as? [String: Any] {

                    guard let notificationId = data["id"] as? String,
                          let timeStamp = data["timestamp"] as? TimeInterval else {
                        return
                    }

                    let filter = DoNotDisturbNotifications.typesOfNotifications.filter({
                        return $0.id == notificationId
                    })

                    guard let notificationType = filter.first else {
                        return
                    }

                    let request = DoNotDisturbRequest(id: request.key, notificationType: notificationType, timestamp: Date(timeIntervalSince1970: timeStamp))

                    self.doNotDisturbRequests.append(request)
                }
            }

            self.doNotDisturbRequests.sort { (r1, r2) -> Bool in
                guard let r1date = r1.timestamp else {
                    return false
                }

                guard let r2date = r2.timestamp else {
                    return true
                }

                return r1date > r2date
            }

            print(self.doNotDisturbRequests)
        }
    }
}
