//
//  NavigationController.swift
//  Navigation
//
//  Created by Anton Kaliuzhnyi on 26.04.2025.
//

import SwiftUI

class NavigationController: ObservableObject {
    @Published private(set) var views: [AnyView]

    var view: some View {
        NavigationView {
            StackView(level: 0)
        }
        .environmentObject(self)
    }

    init<Content: View>(root: Content) {
        self.views = [AnyView(root)]
    }

    func push<V: View>(_ view: V) {
        views.append(AnyView(view))
    }

    func pop() {
        guard views.count > 1 else { return }
        _ = views.popLast()
    }

    func popToRoot() {
        views = [views.first!]
    }

    func popToLevel(_ level: Int) {
        if views.count > level + 1 {
            views = Array(views.prefix(level + 1))
        }
    }
}
