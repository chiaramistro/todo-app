//
//  Profile.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var priorityTask = TaskType.home
    var goalDate = Date()
    var balance: Double = 10.0
    var goalDailyTasks: Int = 20

    static let `default` = Profile(username: "test_user")
}

enum TaskType: String, CaseIterable, Identifiable {
    case home = "🏠"
    case cleaning = "🧹"
    case studying = "📚"

    var id: String { rawValue }
    var typeString: String {
        switch self {
        case .home:
            return "Home"
        case .cleaning:
            return "Cleaning"
        case .studying:
            return "Studying"
        }
    }
}
