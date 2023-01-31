//
//  CategoryRow.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Todo]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(categoryName)").font(.title).padding(.bottom, 8).foregroundColor(Color.theme.white).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items) { item in
                        NavigationLink {
                            TodoDetailsView(todo: item)
                        } label: {
                            CategoryItem(item: item)
                        }
                    }
                }
            }
            .frame(height: 150)
        }.padding()
        .background(Color.theme.secondary)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var todos = ModelData().todos
    
    static var previews: some View {
        CategoryRow(
            categoryName: todos[0].category.rawValue,
            items: Array(todos)
        )
    }
}
