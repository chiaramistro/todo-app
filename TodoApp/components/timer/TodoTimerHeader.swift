//
//  TodoTimerHeader.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 31/01/23.
//

import SwiftUI

struct TodoTimerHeader: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .tint(Color.theme.primary)
                .background(Color.theme.white)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption).foregroundColor(Color.theme.white)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill").foregroundColor(Color.theme.white)
                    
                }
                // Add a spacer between each VStack to use available space from the containing parent view.
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption).foregroundColor(Color.theme.white)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill").foregroundColor(Color.theme.white).labelStyle(.trailingIcon)
                }
            }
        }
    }
}

struct TodoTimerHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerHeader(secondsElapsed: 200, secondsRemaining: 500).background(Color.theme.secondary).padding()
    }
}
