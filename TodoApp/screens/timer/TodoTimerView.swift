//
//  TodoTimerView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import SwiftUI

struct TodoTimerView: View {
    @State var timerData: TimerData
    
    @StateObject var timerManager = TimerManager()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.yellow).padding()
            VStack {
                TodoTimerHeader(secondsElapsed: timerManager.secondsElapsed, secondsRemaining: timerManager.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24)
                    .foregroundColor(Color.theme.white)
                Text("My todo").foregroundColor(Color.theme.white).bold()
            }.padding(32)
        }.background(Color.theme.secondary)
        .onAppear {
            timerManager.reset(lengthInMinutes: timerData.lengthInMinutes)
            timerManager.startTimer()
         }.onDisappear {
             timerManager.stopTimer()
         }

    }
}

struct TodoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerView(timerData: TimerData())
    }
}
