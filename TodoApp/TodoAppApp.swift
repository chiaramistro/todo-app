//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Chiara Mistrorigo on 20/01/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
    //Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.
    @StateObject private var modelData = ModelData()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // add the model object to the environment, which makes the object available to any subview.
                .environmentObject(modelData)
        }
    }
}

//get back the old UIApplicationDelegate functionality we used to have – perhaps to handle registration for push notifications, to respond to memory warnings, to detect time changes, and so on.

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Override point for customization after application launch.
        //        let theme = ThemeManager.currentTheme()
        //        ThemeManager.applyTheme()
        
        
        //    https://stackoverflow.com/questions/26008536/navigationbar-bar-tint-and-title-text-color-in-ios-8
        //        UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        //        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : ColorTheme.navBarTextColor]
        
        
        //        UITabBar.appearance().barTintColor = UIColor(Color.theme.primary)
        //        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(Color.theme.primary)], for: .normal)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.primary)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(Color.theme.white)], for: .selected)
        
        return true
    }
}
