//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct AddTodoView: View {
//    @State private var tapCount = 0
    @Binding var newTodoData: Todo
    
    @Binding var showAddNewTodoModal: Bool
    
    var body: some View {
        VStack {
            Text("Add new todo").foregroundColor(Color.theme.white).font(.largeTitle).bold().padding(.top, 10)
            
            Form {
                Section {
                    TextField("Enter todo", text: $newTodoData.name)
                } header: {
                    Text("Next todo").foregroundColor(Color.theme.white)
                }
                
                Section {
                    TextEditor(text: $newTodoData.description)
                } header: {
                    Text("Description").foregroundColor(Color.theme.white)
                }
                
                Section {
                    TextField("Enter name", text: $newTodoData.imageName)
                } header: {
                    Text("Image").foregroundColor(Color.theme.white)
                }
                
                Section {
                    VStack(alignment: .center) {
                        Picker("Select task", selection: $newTodoData.category) {
                            ForEach(TaskType.allCases, id: \.self) { task in
                                Text(task.icon).tag(task)
                            }
                        }.pickerStyle(.segmented)
                        Text(newTodoData.category.id.uppercased()).foregroundColor(.black).tracking(10).bold().padding([.top, .bottom], 5)
                    }
                } header: {
                    Text("Select your priority task").foregroundColor(Color.theme.white)
                }
                
                Section {
                    Toggle(isOn: $newTodoData.completed) {
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
        return newTodoData.completed ? "Completed" : "To do"
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        AddTodoView(newTodoData: .constant(modelData.todos[0]), showAddNewTodoModal: .constant(true))
    }
}
