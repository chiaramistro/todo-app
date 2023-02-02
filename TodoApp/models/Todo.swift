//
//  Todo.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import Foundation

//Codable: move data beetween structure and a data file
//Decodable: to read data from file
//Identifiable: id property required
struct Todo: Hashable, Codable, Identifiable {
    var id: String = "0"
    var name: String = ""
    var description: String = ""
    var completed: Bool = false
    
    var imageName: String = "" // read image from data (private since we use the Image to render it, we are not interested about name)
    var imageDetail: CircleImage { // loads from assets
        CircleImage(image: imageName, size: 200.0)
    }
    var imageCategory: CircleImage { // loads from assets
        CircleImage(image: imageName, size: 100.0)
    }
    
    var category: TaskType = .home
   

}
