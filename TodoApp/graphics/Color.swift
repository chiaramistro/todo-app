//
//  Color.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 26/01/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let darkGreen = Color("DarkGreenColor")
    let primary = Color("PrimaryColor")
    let secondary = Color("SecondaryColor")
    let tertiary = Color("TertiaryColor")
    let white = Color("WhiteColor")
    
    static var navBarTextColor: UIColor  {
        return .white
     }
    
//    static var todoColorList: [Color] {
//        return [.orange, .teal, .yellow, .cyan, .mint, .pink, .indigo, .purple, .green, .blue, .red, .brown]
//     }
    
//    static func getTodoColorText(backgroundColor: Color) -> Color {
//        switch backgroundColor {
//        case .orange, .teal, .yellow, .cyan, .mint, .pink:
//            return .black
//        case .indigo, .purple, .green, .blue, .red, .brown :
//            return .white
//        default:
//          return .white
//        }
//    }
    
}
