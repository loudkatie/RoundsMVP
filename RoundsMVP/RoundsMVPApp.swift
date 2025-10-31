//
//  RoundsMVPApp.swift
//  RoundsMVP
//

import SwiftUI

@main
struct RoundsMVPApp: App {
    @StateObject private var app = AppModel()

    var body: some Scene {
        WindowGroup {
            RootSwitcher()
                .environmentObject(app)
                .tint(.blue) // global accent
        }
    }
}

private struct RootSwitcher: View {
    @EnvironmentObject private var app: AppModel

    var body: some View {
        Group {
            if app.hasCompletedOnboarding {
                RoundsView()
            } else {
                OnboardingView()
            }
        }
    }
}
