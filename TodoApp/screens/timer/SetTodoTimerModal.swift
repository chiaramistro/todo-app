//
//  SetTodoTimerModal.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 31/01/23.
//

import SwiftUI

struct SetTodoTimerModal: View {
    @Binding var showSetTimerModal: Bool
    @Binding var goToTimerView: Bool
    @State private var timerData: TimerData = TimerData()
    @State private var newSubtask = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                HStack() {
                    Spacer()
                    Button {
                        self.showSetTimerModal.toggle()
                    } label: {
                        Text("Dismiss").font(.headline).foregroundColor(Color.theme.primary)
                    }.padding()
                }
                
                Form {
                    Section(
                        header: Text("Set a timer for your todo")
                            .foregroundColor(Color.theme.white)) {
                                
                                Slider(value: $timerData.lengthInMinutes, in: 5...30, step: 1) {
                                    Text("Length")
                                }.accentColor(Color.theme.primary)
                                    .accessibilityValue("\(Int(timerData.lengthInMinutes)) minutes")
                                Text("\(Int(timerData.lengthInMinutes)) minutes")
                            }
                    Section(header: Text("Add subtasks to remember")
                        .foregroundColor(Color.theme.white)) {
                        ForEach(timerData.subtasksToRemember, id: \.self) { task in
                            Text(task)
                        }
                        .onDelete { indices in
                            timerData.subtasksToRemember.remove(atOffsets: indices)
                        }
                        HStack {
                            TextField("New subtask", text: $newSubtask)
                            Button(action: {
                                withAnimation {
                                    timerData.subtasksToRemember.append(newSubtask)
                                    newSubtask = ""
                                }
                            }) {
                                Image(systemName: "plus.circle.fill").foregroundColor(disabledAddNewSubtask() ? .gray : Color.theme.primary).accessibilityLabel("Add subtask")
                                
                            }
                            .disabled(disabledAddNewSubtask())
                        }
                    }
                }.scrollContentBackground(.hidden)
                
                Spacer()
                
                Button(action: {
                    // create new object and pass to another page
                    self.showSetTimerModal.toggle()
                    self.goToTimerView.toggle()
                }) {
                    Text("Submit").foregroundColor(Color.theme.primary).bold()
                }.padding()
                
                            
            }.background(Color.theme.secondary)

        }
        
    }
    
    func disabledAddNewSubtask() -> Bool {
        return newSubtask.isEmpty
    }
}

struct SetTodoTimerModal_Previews: PreviewProvider {
    static var previews: some View {
        SetTodoTimerModal(showSetTimerModal: .constant(true), goToTimerView: .constant(false))
    }
}
