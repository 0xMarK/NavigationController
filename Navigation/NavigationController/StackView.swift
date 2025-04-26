//
//  StackView.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

struct StackView: View {
    @EnvironmentObject var controller: NavigationController
    @Environment(\.dismiss) private var dismiss

    let level: Int
    @State private var isActive: Bool = false

    var body: some View {
        Group {
            if controller.views.indices.contains(level) {
                controller.views[level]
            }
        }
        .background {
            NavigationLink(
                destination: Group {
                    if controller.views.indices.contains(level + 1) {
                        StackView(level: level + 1)
                    }
                },
                isActive: $isActive,
                label: { EmptyView() }
            )
            .hidden()
        }
        .onChange(of: controller.views.count) { newCount in
            isActive = newCount > level + 1
            if newCount < level + 1 {
                dismiss()
            }
        }
        .onChange(of: isActive) { newValue in
            if !newValue {
                controller.popToLevel(level)
            }
        }
    }
}
