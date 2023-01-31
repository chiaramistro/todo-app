//
//  CircleImage.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 20/01/23.
//

import SwiftUI

struct CircleImage: View {
    @State var image: String
    @State var size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
            .frame(width: size, height: size)
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 5))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    // set a constant value to see the preview of your component
    
    static var previews: some View {
        CircleImage(image: "0e5", size: 100.0)
    }
}
