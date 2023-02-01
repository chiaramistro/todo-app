//
//  ContentView.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 20/01/23.
//

import SwiftUI

//class Todo: ObservableObject {
//    @Published var name = "My todo"
//}

struct ContentView: View {
    @State var isShowingDetailView = false;
    //    @ObservedObject var todo = Todo()
    
    @State private var selectedTab: Tab = .featured

    
    enum Tab {
        case featured
        case list
    }
    
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
        ContentView()
        // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
            .environmentObject(ModelData())
    }
}
