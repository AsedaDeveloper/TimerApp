//
//  TimerViewModel.swift
//  TimerApp
//
//  Created by Yooku Anamuah-Mensah on 20/05/2023.
//

import SwiftUI
import UserNotifications
import AVFoundation

class TimerViewModel: ObservableObject {
    @Published var isTimerRunning = false
    @Published var timerValue = 0
    @Published var isTimerFinished = false

    private var timer: Timer?
    private var alarmPlayer: AVAudioPlayer?
    private var selectedAlarmSound: String? // Newly added property

    init() {
        // Initialize selectedAlarmSound with a default value if desired
    }

    func startTimer(duration: TimeInterval) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.timerValue += 1
                if self.timerValue >= Int(duration) {
                    self.stopTimer()
                    self.playSelectedAlarmSound()
                    self.sendNotification()
                    self.isTimerFinished = true
                }
            }
            isTimerRunning = true
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerValue = 0
        isTimerRunning = false
        isTimerFinished = false
    }

    func playSelectedAlarmSound() {
        if let selectedAlarmSound = selectedAlarmSound,
            let alarmSoundURL = Bundle.main.url(forResource: selectedAlarmSound, withExtension: "mp3") {
            alarmPlayer = try? AVAudioPlayer(contentsOf: alarmSoundURL)
            alarmPlayer?.prepareToPlay()
            alarmPlayer?.play()
        }
    }

    private func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Timer Finished"
        content.body = "Your timer has ended."
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: "timerNotification", content: content, trigger: nil)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error sending notification: \(error)")
            }
        }

        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
