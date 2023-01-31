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
                    AddTodoView(showAddNewTodoModal: $showAddNewTodo)
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
