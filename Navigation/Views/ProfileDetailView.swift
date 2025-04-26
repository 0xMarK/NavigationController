//
//  ProfileDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct ProfileDetailView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Detail View")
                .font(.largeTitle)
            Button("Go to Profile Sub Detail") {
                controller.push(ProfileSubDetailView())
            }
            Button("Back") {
                controller.pop()
            }
        }
        .navigationTitle("Profile Detail")
    }
}
