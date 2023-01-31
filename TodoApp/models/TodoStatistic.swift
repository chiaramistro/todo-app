//
//  TodoStatistic.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import Foundation

struct TodoStatistic: Codable, Hashable, Identifiable {
    var id: Int
    var weekStart: String
    var weekEnd: String
    var totalTasksCompleted: Int
    var dailyTasks: [DailyTask]

    struct DailyTask: Codable, Hashable {
        var date: String
        var tasksCompleted: Int
    }
}
