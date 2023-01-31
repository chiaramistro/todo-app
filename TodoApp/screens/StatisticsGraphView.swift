//
//  StatisticsGraphView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 24/01/23.
//

import SwiftUI
import Charts

struct StatisticsGraphView: View {
    @EnvironmentObject var modelData: ModelData
    @State var currentIndex: Int = 0
    
    var body: some View {
        NavigationStack {
                VStack {
                    HStack(alignment: .center) {
                        Button(action: previous) {
                            Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        }.foregroundColor(disabledPrevious() ? .gray : Color.theme.white).disabled(disabledPrevious())
                        Text(getTitle()).frame(maxWidth: .infinity).foregroundColor(Color.theme.white).bold()
                        Button(action: next) {
                            Image(systemName: "arrowshape.turn.up.right.circle.fill")
                        }.foregroundColor(disabledNext() ? .gray : Color.theme.white).disabled(disabledNext())
                    }
                    GraphView(todoStatistic: modelData.todoStatistics[currentIndex]).padding([.top], 16)
                    Divider().overlay(Color.theme.white)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Total tasks completed:").foregroundColor(Color.theme.white)
                            Spacer()
                            Text("\(modelData.todoStatistics[currentIndex].totalTasksCompleted)").fontWeight(.bold).foregroundColor(Color.theme.primary)
                        }
                        HStack {
                            Text("Daily average of tasks completed:").foregroundColor(Color.theme.white)
                            Spacer()
                            Text(calculateAverage()).fontWeight(.bold).foregroundColor(Color.theme.primary)
                        }
                    }.padding([.top], 10)
                }
                .padding()
                .navigationBarTitle("Your statistics", displayMode: .inline)
                .background(Color.theme.darkGreen)
        }
    }
    
//    https://www.swiftbysundell.com/articles/formatting-numbers-in-swift/
    func calculateAverage() -> String {
        return String(format: "%.2f", Double(modelData.todoStatistics[currentIndex].totalTasksCompleted) / 7.0)
    }
    
    func previous() {
        if (disabledPrevious()) {
            return
        }
        self.currentIndex -= 1
    }
    
    func next() {
        if (disabledNext()) {
            return
        }
        self.currentIndex += 1
    }
    
    func disabledPrevious() -> Bool {
        return self.currentIndex == 0
    }
    
    func disabledNext() -> Bool {
        return self.currentIndex == modelData.todoStatistics.capacity-1
    }
    
    func getTitle() -> String {
        let weekStart = self.formatDate(dateString: modelData.todoStatistics[currentIndex].weekStart)
        let weekEnd = self.formatDate(dateString: modelData.todoStatistics[currentIndex].weekEnd)
        return "\(weekStart) - \(weekEnd)"
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //        handle nil values
        guard let date = dateFormatter.date(from: dateString) else {
            print("Invalid date string")
            return "Invalid date"
        }
        dateFormatter.dateFormat = "dd MMM yyyy"
        let newDateString = dateFormatter.string(from: date)
        return newDateString
    }
}

struct GraphView: View {
    var todoStatistic: TodoStatistic
    var daysOfWeek = 7
    
    var body: some View {
        Chart {
            ForEach(0..<daysOfWeek, id: \.self) { day in
                let dailyTasks = getDailyTaskCompleted(dayNumber: day)
                let dayNumber = day+1
                BarMark(
                    x: .value("Day", dayNumber),
                    y: .value("Tasks completed", dailyTasks)
                ).annotation {
                    Text(String(dailyTasks))
                        .font(.caption).foregroundColor(Color.theme.white)
                }.foregroundStyle(by: .value("Task Color", "Primary"))
                
            }
        }.chartForegroundStyleScale([
            "Primary": Color.theme.primary
        ])
        .chartLegend(position: .bottom, alignment: .top, spacing: 16) {
            // display no chart
        }
    }
    
    func getDailyTaskCompleted(dayNumber: Int) -> Int {
        let dailyTask = todoStatistic.dailyTasks[dayNumber]
        return dailyTask.tasksCompleted
    }
    
}

struct StatisticsGraphView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        StatisticsGraphView().environmentObject(modelData)
    }
}
