//
//  Todo.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct TodoItem: View {
    var todo: Todo
    
    var body: some View {
        HStack {
            Text(todo.name).strikethrough(todo.completed).foregroundColor(Color.theme.white)
        }
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItem(todo: ModelData().todos[0])
            TodoItem(todo: ModelData().todos[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
