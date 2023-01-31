//
//  TodoTimerView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

import SwiftUI

struct TodoTimerView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
                .tint(Color.theme.primary)
                .background(Color.theme.white)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed").font(.caption).foregroundColor(Color.theme.white)
                    Label("300", systemImage: "hourglass.bottomhalf.fill").foregroundColor(Color.theme.white)
                    
                }
                //                        Add a spacer between each VStack to use available space from the containing parent view.
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining").font(.caption).foregroundColor(Color.theme.white)
                    Label("600", systemImage: "hourglass.tophalf.fill").foregroundColor(Color.theme.white).labelStyle(.trailingIcon)
                }
            }
            Circle()
                .strokeBorder(lineWidth: 24)
                .foregroundColor(Color.theme.white)
            Text("My todo").foregroundColor(Color.theme.white).bold()
        }.padding()
        .navigationTitle("Timer")
        .background(Color.theme.secondary)
    }
}

struct TodoTimerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoTimerView()
    }
}
