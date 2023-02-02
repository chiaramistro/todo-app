//
//  TodoTimerView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import SwiftUI
// audiovisual media
import AVFoundation

struct TodoTimerView: View {
    var todoTitle: String
    @State var timerData: TimerData
    
//     Wrapping a reference type property as a @StateObject keeps the object alive for the life cycle of a view.
    @StateObject var timerManager = TimerManager()
    
//    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.yellow).padding()
            VStack {
                TodoTimerHeader(secondsElapsed: timerManager.secondsElapsed, secondsRemaining: timerManager.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24)
                    .foregroundColor(Color.theme.white)
                Text("\(todoTitle)").foregroundColor(Color.theme.white).bold()
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
        TodoTimerView(todoTitle: "Example todo", timerData: TimerData())
    }
}
