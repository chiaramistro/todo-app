//
//  CheckButton.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import SwiftUI

struct CheckButton: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: myAction) {
            // button’s label doesn’t appear in the UI when you use the iconOnly label style
            // accessibility reasons
            Label("Check", systemImage: isChecked ? "checkmark.circle.fill" : "checkmark.circle").labelStyle(.iconOnly)
        }.foregroundColor(Color.theme.primary)
    }
    
    func myAction() {
        self.isChecked.toggle()
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(isChecked: .constant(true))
    }
}
