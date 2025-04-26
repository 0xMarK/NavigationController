//
//  SettingsDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct SettingsDetailView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings Detail View")
                .font(.largeTitle)
            Button("Back") {
                controller.pop()
            }
            Button("Pop to Root") {
                controller.popToRoot()
            }
        }
        .navigationTitle("Settings Detail")
    }
}
