//
//  IPadViewController.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import Then
import UIKit
import AVFoundation
import Firebase

class IPadViewController: UIViewController, AVAudioPlayerDelegate {

    var avPlayer: AVAudioPlayer!

    private lazy var doNotDisturbButton = DoNotDisturbButton(title: "Please Do Not Disturb", backgroundColor: .systemPink).then {
        $0.addTarget(self, action: #selector(didTapModeOn), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(doNotDisturbButton)

        NSLayoutConstraint.activate ([
            doNotDisturbButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            doNotDisturbButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            doNotDisturbButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
            doNotDisturbButton.widthAnchor.constraint(equalTo: doNotDisturbButton.heightAnchor)
        ])
    }

    @objc private func didTapModeOn() {

        let noDisturbNotifications = DoNotDisturbNotifications()

        let notificationType = noDisturbNotifications.randomDoNotDisturbNotification()

        playAudio(withURLString: notificationType.audioFile)

        var ref: DatabaseReference!
        ref = Database.database().reference()
        let data : [String: Any] = [
            "id": notificationType.id,
            "timestamp": Date().timeIntervalSince1970,
            "speech": notificationType.speech
        ]
        ref.child("notifications").childByAutoId().setValue(data)

    }

    private func setupAudio() {
        let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(.playback)
            try session.setActive(true)
        } catch let error as NSError {
            print("Unable to activate audio session:  \(error.localizedDescription)")
        }
    }

    private func playAudio(withURLString audioURLString: String) {
        let audioFileURL = URL(fileURLWithPath: Bundle.main.path(forResource: audioURLString, ofType: "mp3")!)

        do {
            avPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            avPlayer.delegate = self
            avPlayer.prepareToPlay()
            avPlayer.play()
        }
        catch {
            print("error occured")
        }
    }

}
