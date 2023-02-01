//
//  TodoTimerView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import SwiftUI

struct TodoTimerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(.yellow).padding()
            VStack {
                TodoTimerHeader()
                Circle()
                    .strokeBorder(lineWidth: 24)
                    .foregroundColor(Color.theme.white)
                Text("My todo").foregroundColor(Color.theme.white).bold()
            }.padding(32)
        }.background(Color.theme.secondary)
    }
}

struct TodoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerView()
    }
}
