//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct AddTodoView: View {
    @State private var tapCount = 0
    @State private var name: String = "My next todo..."
    @State private var description: String = "My next todo will be..."
    @State private var imageName: String = ""
    @State private var priorityTask = TaskType.home // default
    @State private var status: Bool = true
    @Binding var showAddNewTodoModal: Bool
    
    var body: some View {
        VStack {
            Text("Add new todo").foregroundColor(Color.theme.white).font(.largeTitle).bold().padding(.top, 10)
            
            Form {
                Section {
                    TextField("Enter todo", text: $name)
                } header: {
                    Text("Next todo").foregroundColor(Color.theme.white)
                }
                
                Section {
                    TextEditor(text: $description)
                } header: {
                    Text("Description").foregroundColor(Color.theme.white)
                }
                
                Section {
                    TextField("Enter name", text: $imageName)
                } header: {
                    Text("Image").foregroundColor(Color.theme.white)
                }
                
                Section {
                    VStack(alignment: .center) {
                        Picker("Select task", selection: $priorityTask) {
                            ForEach(TaskType.allCases, id: \.self) { task in
                                Text(task.rawValue).tag(task)
                            }
                        }.pickerStyle(.segmented)
                        Text(priorityTask.typeString.uppercased()).foregroundColor(.black).tracking(10).bold().padding([.top, .bottom], 5)
                    }
                } header: {
                    Text("Select your priority task").foregroundColor(Color.theme.white)
                }
                
                Section {
                    Toggle(isOn: $status) {
                        Text("\(getCurrentStatus())")
                    }.tint(Color.theme.primary)
                } header: {
                    Text("Status").foregroundColor(Color.theme.white)
                }
                
            }.scrollContentBackground(.hidden)
            
//            Spacer()
//
//            Button(action: {
//                self.showAddNewTodoModal.toggle()
//            }) {
//                Text("Submit").foregroundColor(Color.theme.primary).bold()
//            }.padding()
//
//            Button(action: {
//                self.showAddNewTodoModal.toggle()
//            }) {
//                Text("Cancel").foregroundColor(Color.theme.white).bold()
//            }
            
            //            Text("Count: \(tapCount)")
            //            Button("Tap Count: \(tapCount)") {
            //                self.tapCount += 1
            //            }
            
        }
            .background(Color.theme.secondary)
    }
    
    func getCurrentStatus() -> String {
        return status ? "Completed" : "To do"
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(showAddNewTodoModal: .constant(true))
    }
}
