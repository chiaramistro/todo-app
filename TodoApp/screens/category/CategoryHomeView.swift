//
//  CategoryHomeView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct CategoryHomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showAddNewTodo = false
    
    @State private var newTodoData = Todo()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
                    .background(Color.theme.darkGreen)
            }.scrollContentBackground(.hidden)
                .navigationBarTitle(Text("Featured").foregroundColor(Color.white).underline(), displayMode: .inline)
                .navigationBarItems(leading: NavigationLink(destination: ProfileView()) {
                    // systemName accesses Apple’s SF Symbols
                    // if we use only the string, it accesses the project's assets
                    Image(systemName: "person.fill")
                }
                    .foregroundColor(Color.theme.white),
                                    trailing:
                                        Button {
                    showAddNewTodo.toggle()
                } label: {
                    Label("Add new todo", systemImage: "plus.circle.fill")
                }
                    .foregroundColor(Color.theme.white))
                .sheet(isPresented: $showAddNewTodo) {
                    NavigationView {
                        AddTodoView(
                            newTodoData: $newTodoData,
                            showAddNewTodoModal: $showAddNewTodo)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    showAddNewTodo = false
                                    newTodoData = Todo() // reset
                                }.foregroundColor(Color.theme.white)
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    newTodoData.id = UUID().uuidString // generate unique id
                                    modelData.addNewTodo(newTodo: newTodoData)
                                    showAddNewTodo = false
                                    newTodoData = Todo() // reset
                                }.foregroundColor(Color.theme.primary)
                            }
                        }
                    }
                }
                .background(Color.theme.darkGreen)
        }
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView().environmentObject(ModelData())
    }
}
