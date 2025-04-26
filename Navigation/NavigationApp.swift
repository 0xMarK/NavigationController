//
//  NavigationApp.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 04.03.2025.
//

import SwiftUI

@main
struct NavigationApp: App {
    @StateObject var controller = NavigationController(root: HomeView())
    
    var body: some Scene {
        WindowGroup {
            controller.view
        }
    }
}
