//
//  ProfileSummary.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        VStack {
            Text("\(profile.username)").font(.title).bold().foregroundColor(Color.theme.white).padding([.top], 20)
            HStack(alignment: .center) {
                Text("Notifications: ").foregroundColor(Color.theme.white)
                Text("\(getNotificationStatus(prefersNotifications: profile.prefersNotifications))").bold().foregroundColor(Color.theme.primary)
            }.padding(5)
            HStack(alignment: .center) {
                Text("Goal Date: ").foregroundColor(Color.theme.white)
                Text(profile.goalDate, style: .date).bold().foregroundColor(Color.theme.primary)
            }.padding(5)
            VStack(alignment: .center) {
                Text("Priority Task: ").foregroundColor(Color.theme.white)
                Text("\(profile.priorityTask.rawValue)")
                    .frame(width: 200, height: 200)
                    .font(.custom("Very big", size: 90))
                    .background(Color.theme.secondary)
                    .cornerRadius(100)
            }.padding(5)
            HStack(alignment: .center) {
                Text("Goal number of tasks per day: ").foregroundColor(Color.theme.white)
                Text("\(profile.goalDailyTasks)").bold().foregroundColor(Color.theme.primary)
            }.padding(5)
        }
    }
    
    func getNotificationStatus(prefersNotifications: Bool) -> String {
        return prefersNotifications ? "ON" : "OFF"
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
