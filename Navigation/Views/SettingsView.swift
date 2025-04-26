//
//  SettingsView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings View").font(.largeTitle)
            Button("Go to Settings Detail") {
                controller.push(SettingsDetailView())
            }
            Button("Back") {
                controller.pop()
            }
        }
        .navigationTitle("Settings")
    }
}
