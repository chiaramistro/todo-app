//
//  CategoryItem.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI

struct CategoryItem: View {
    var item: Todo
    
//    var backgroundColor: Color  {
//        return ColorTheme.todoColorList.randomElement()!
//     }
    
//    var textColor: Color  {
//        return ColorTheme.getTodoColorText(backgroundColor: backgroundColor)
//    }

    var body: some View {
//         item.imageCategory
            Text(item.name)
            .frame(width: 100, height: 100, alignment: .leading)
                .font(.headline)
                .foregroundColor(Color.theme.white)
                .padding(10)
                .background(randomColor())               .cornerRadius(15)
                .multilineTextAlignment(.leading)
    }
    
    func randomColor() -> Color {
        return Color(uiColor: UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        ))
    }
                            
                            
                            
}

struct CategoryItem_Previews: PreviewProvider {
    static var todos = ModelData().todos
    
    static var previews: some View {
        CategoryItem(item: todos[0])
    }
}
