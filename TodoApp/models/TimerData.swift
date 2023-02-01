//
//  TimerData.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import Foundation

struct TimerData {
//    var motivationalQuote: String = ""
    var lengthInMinutes: Double = 5
    var subtasksToRemember: [String] = []
}

class TimerManager: ObservableObject {
    
        private(set) var lengthInMinutes: Int
    
        private var lengthInSeconds: Int { lengthInMinutes * 60 }

        @Published var secondsElapsed = 0
        @Published var secondsRemaining = 0
    
        private var timer: Timer?
        private var timerStopped = false
        private var frequency: TimeInterval { 1.0 / 60.0 }
    
        init(lengthInMinutes: Double = 0.0) {
            self.lengthInMinutes = Int(lengthInMinutes)
            secondsRemaining = lengthInSeconds
            secondsElapsed = 0
        }
    
        func reset(lengthInMinutes: Double) {
            self.lengthInMinutes = Int(lengthInMinutes)
            secondsRemaining = lengthInSeconds
            secondsElapsed = 0
        }

        func stopTimer() {
            print("stopTimer()")
            timer?.invalidate()
            timer = nil
            timerStopped = true
        }

        func startTimer() {
            print("startTimer()")
            let startDate = Date()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
                print("startTimer() secondsElapsed \(self.secondsElapsed)")
                self.updateTimer()
            }
        }
    
        private func updateTimer() {
            print("updateTimer()")
            guard !timerStopped else { return }
            secondsRemaining = max(lengthInSeconds - secondsElapsed, 0)
            print("updateTimer() secondsRemaining \(secondsRemaining)")
        }
}
