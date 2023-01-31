//
//  TodoList.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

//Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
struct TodoList: View {
    var body: some View {
        Text("List")
//        NavigationView  {
//            //        List(todos, id: \.id) { todo in
//            List(todos) { todo in //if model is identifiable, no need to specify id
//                NavigationLink {
//                    TodoDetailsView(todo: todo)
//                } label: {
//                    TodoItem(todo: todo)
//                }
//            }
//        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
