//
//  TrailingIconLabelStyle.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 30/01/23.
//

//If you don’t want to create a custom label style, you can use one of the built-in label styles that display the icon, the title, or both using a system-standard layout.

import Foundation
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
