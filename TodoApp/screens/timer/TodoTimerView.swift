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
    @State var timerData: TimerData
    
//     Wrapping a reference type property as a @StateObject keeps the object alive for the life cycle of a view.
    @StateObject var timerManager = TimerManager()
    @State var isTimerOn: Bool = true
    
//    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.yellow).padding()
            VStack {
                TodoTimerHeader(secondsElapsed: timerManager.secondsElapsed, secondsRemaining: timerManager.secondsRemaining)
                
                Button(action: {
                    if isTimerOn {
                        timerManager.pauseTimer()
                    } else {
                        timerManager.resumeTimer(secondsElapsed: timerManager.secondsElapsed, secondsRemaining: timerManager.secondsRemaining)
                    }
                    isTimerOn.toggle()
                }) {
                    Image(systemName: isTimerOn ? "pause.circle.fill" : "play.circle.fill")
                        .font(.largeTitle)
                }.foregroundColor(Color.theme.white)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .overlay(
                        Circle()
                            .strokeBorder(lineWidth: 24)
                            .foregroundColor(Color.theme.white)
                            .padding(6)
                        
                    )
                Text("\(timerData.todoName)").foregroundColor(Color.theme.white).bold()
            }.padding(32)
        }.background(Color.theme.secondary)
            .onAppear {
                timerManager.reset(lengthInMinutes: timerData.lengthInMinutes, todoName: timerData.todoName)
                timerManager.startTimer()
            }.onDisappear {
                timerManager.stopTimer()
            }
        
    }
}

struct TodoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerView(timerData: TimerData(todoName: "My todo"))
    }
}
