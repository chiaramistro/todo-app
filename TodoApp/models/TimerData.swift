//
//  TimerData.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import Foundation

struct TimerData {
    var todoName: String = ""
    var lengthInMinutes: Double = 5
    var subtasksToRemember: [String] = []
}

class TimerManager: ObservableObject {
    
        private(set) var todoName: String
        private(set) var lengthInMinutes: Int
    
        private var lengthInSeconds: Int { lengthInMinutes * 60 }

//     emits property changes to a subscriber.
        @Published var secondsElapsed = 0
        @Published var secondsRemaining = 0
    
        private var timer: Timer?
        private var timerStopped = false
        // private var frequency: TimeInterval { 1.0 / 60.0 }
    
        init(lengthInMinutes: Double = 0.0, todoName: String = "") {
            self.todoName = todoName
            self.lengthInMinutes = Int(lengthInMinutes)
            secondsRemaining = lengthInSeconds
            secondsElapsed = 0
        }
    
        func reset(lengthInMinutes: Double, todoName: String) {
            self.todoName = todoName
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

        func startTimer(secondsAlreadyElapsed: Int = 0) {
            print("startTimer()")
            let startDate = Date()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.secondsElapsed = secondsAlreadyElapsed + Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
                print("startTimer() secondsElapsed \(self.secondsElapsed)")
                self.updateTimer()
            }
        }
    
        func pauseTimer() {
            print("pauseTimer()")
            timer?.invalidate()
            timer = nil
            timerStopped = true
        }
    
        func resumeTimer(secondsElapsed: Int, secondsRemaining: Int) {
            print("resumeTimer()")
            timerStopped = false
            self.secondsRemaining = secondsRemaining
            self.startTimer(secondsAlreadyElapsed: secondsElapsed)
        }
    
        private func updateTimer() {
            print("updateTimer()")
            guard !timerStopped else { return }
            secondsRemaining = max(lengthInSeconds - secondsElapsed, 0)
            print("updateTimer() secondsRemaining \(secondsRemaining)")
        }
}
