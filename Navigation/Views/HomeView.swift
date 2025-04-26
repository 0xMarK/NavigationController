//
//  HomeView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Home View").font(.largeTitle)
            Button("Go to Profile") {
                controller.push(ProfileView())
            }
            Button("Go to Settings") {
                controller.push(SettingsView())
            }
        }
        .navigationTitle("Home")
    }
}
