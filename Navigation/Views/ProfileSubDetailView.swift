//
//  ProfileSubDetailView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct ProfileSubDetailView: View {
    @EnvironmentObject var controller: NavigationController

    var body: some View {
        VStack(spacing: 20) {
            Text("Profile Sub Detail View")
                .font(.largeTitle)
            Button("Back") {
                controller.pop()
            }
            Button("Pop to Root") {
                controller.popToRoot()
            }
        }
        .navigationTitle("Profile Sub Detail")
    }
}
