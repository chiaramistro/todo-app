//
//  ContentView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 20/01/23.
//

// main UI for the app

import SwiftUI

//class Todo: ObservableObject {
//    @Published var name = "My todo"
//}

// View protocol comes from Swift UI = our layout
struct ContentView: View {
    @State var isShowingDetailView = false;
    //    @ObservedObject var todo = Todo()
    
    @State private var selectedTab: Tab = .featured

    
    enum Tab {
        case featured
        case list
    }
    
    // body: only required property of View
    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.featured)

            TodoList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }.accentColor(Color.theme.white)
    }
}

// preview the design alongside code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            ContentView()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        ContentView()
        // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
            .environmentObject(ModelData())
    }
}
