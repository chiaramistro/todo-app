//
//  ProfileEditor.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        VStack {
            Form {
                HStack(alignment: .center) {
                    TextField("Username", text: $profile.username).font(.title).bold()
                }.padding(5)
                HStack(alignment: .center) {
                    Toggle(isOn: $profile.prefersNotifications) {
                        Text("Toggle notifications")
                    }.tint(Color.theme.primary)
                }.padding(5)
                HStack(alignment: .center) {
                    DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                        Text("Goal Date")
                    }
                }.padding(5)
                VStack(alignment: .leading) {
                    //                    Text("Priority Task: ")
                    Section {
                        Picker("Select task", selection: $profile.priorityTask) {
                            ForEach(TaskType.allCases, id: \.self) { task in
                                Text(task.icon).tag(task)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("Select your priority task")
                    }
                }.padding(5)
                HStack {
                    Picker("Number of tasks per day", selection: $profile.goalDailyTasks) {
                            ForEach(0 ..< 100) {
                                Text("\($0) tasks")
                            }
                        }
                }.padding(5)
            }.background(Color.theme.secondary)
            .scrollContentBackground(.hidden)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
