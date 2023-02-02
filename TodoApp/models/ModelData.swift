//
//  ModelData.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 23/01/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
//    SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.
    
//    An observable object needs to publish any changes to its data, so that its subscribers can pick up the change.
    
    @Published var todos: [Todo] = load("todoData.json")
    
//    you’ll never modify hike data after initially loading it, you don’t need to mark it with the @Published attribute.
    var todoStatistics: [TodoStatistic] = load("todoStatistics.json")
    
//    create a dictionary for easier data access
    var categories: [String: [Todo]] {
        Dictionary(
            grouping: todos,
            by: { $0.category.rawValue }
        )
    }
    
    @Published var profile = Profile.default
    
    func addNewTodo(newTodo: Todo) {
        todos.append(newTodo)
    }
}

// create an array initialized with todos from a file

// var todos: [Todo] = load("todoData.json")

//An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment.


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
