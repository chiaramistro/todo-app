//
//  TodoDetailsView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct TodoDetailsView: View {
    //    @EnvironmentObject var todo: Todo
    var todo: Todo
    
    // https://developer.apple.com/forums/thread/660481
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var modelData: ModelData
    @State private var showDescription = false
    @State private var showSetTimerModal = false
    @State private var goToTimerView = false
    @State private var timerData: TimerData = TimerData()
    
    var todoIndex: Int {
        modelData.todos.firstIndex(where: { $0.id == todo.id })!
    }
    
    var body: some View {
        ScrollView {
            todo.imageDetail.padding([.top], 20)
            VStack(alignment: .leading) {
                
                VStack(alignment: .center) {
                    Text("\(todo.name)").font(.title).frame(maxWidth: .infinity).foregroundColor(Color.theme.white).bold()
                    Button {
                        showDescription.toggle()
                        
                    } label: {
                        Label("Description", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDescription ? 90 : 0))
                            .animation(.easeInOut, value: showDescription)
                            .foregroundColor(Color.theme.primary)
                            .padding([.bottom], 20)
                    }.padding([.top], 5)
                    
                }
                
                if (showDescription) {
                    Text(todo.description).font(.body).foregroundColor(Color.theme.white)
                    Divider().overlay(Color.theme.white)
                    HStack(alignment: .center) {
                        Text("Task completed: ").font(.body).foregroundColor(Color.theme.white)
                        CheckButton(isChecked: $modelData.todos[todoIndex].completed)
                    }.padding(EdgeInsets(top: 8.0, leading: 0, bottom: 8.0, trailing: 0))
                }
                
            }.padding()
            
            VStack(alignment: .center) {
                Button(action: {
                    self.showSetTimerModal.toggle()
                }) {
                    Text("Start timer").foregroundColor(Color.theme.white).bold().font(.headline)
                }.padding(10).background(Color.theme.primary).cornerRadius(15)
            }
            
            NavigationLink(destination: TodoTimerView(todoTitle: modelData.todos[todoIndex].name, timerData: timerData), isActive: $goToTimerView) {
                EmptyView() // showing nothing for now
            }
            
        }.navigationBarItems(trailing: Button(action: deleteTodo) {
            Image(systemName: "trash")
        }.foregroundColor(Color.theme.white))
        .navigationTitle("Details")
        .background(Color.theme.darkGreen)
        .sheet(isPresented: $showSetTimerModal) {
            NavigationView {
                SetTodoTimerModal(showSetTimerModal: $showSetTimerModal, goToTimerView: $goToTimerView, timerData: $timerData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showSetTimerModal = false
                                goToTimerView = false
                            }.foregroundColor(Color.theme.white)
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showSetTimerModal = false
                                goToTimerView = true
                            }.foregroundColor(Color.theme.primary)
                        }
                    }
            }
            .presentationDetents([.height(400)]) //                    define height of filter modal
            
        }
        
    }
    
    func deleteTodo() {
        modelData.deleteTodo(todoIndex: todoIndex)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    //    func computeStatus(Bool completed) {
    //        if (completed) {
    //            return "Complete"
    //        } else {
    //            return "To do"
    //        }
    //    }
}

struct TodoDetailsView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        TodoDetailsView(todo: ModelData().todos[0])
            .environmentObject(modelData)
    }
}
