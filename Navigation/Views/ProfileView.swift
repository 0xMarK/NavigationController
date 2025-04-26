//
//  ProfileView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile View")
                .font(.largeTitle)
            Button("Go to Profile Detail") {
                controller.push(ProfileDetailView())
            }
            Button("Back") {
                controller.pop()
            }
        }
        .navigationTitle("Profile")
    }
}
