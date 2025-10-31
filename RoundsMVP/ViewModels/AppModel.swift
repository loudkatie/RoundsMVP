//
//  AppModel.swift
//  RoundsMVP
//

import Foundation
import Combine

/// Keys we’ll persist for the MVP
private enum Keys {
    static let caregiverName = "caregiverName"
    static let patientName   = "patientName"
    static let onboarded     = "hasCompletedOnboarding"
}

/// Simple store using UserDefaults for MVP (we can swap later)
private let defaults = UserDefaults.standard

final class AppModel: ObservableObject {
    // MARK: - Published state
    @Published var caregiverName: String
    @Published var patientName: String
    @Published var hasCompletedOnboarding: Bool

    // Lightweight event stream for quick UI debugging
    @Published var events: [String] = []

    // MARK: - Init / Load
    init() {
        self.caregiverName = defaults.string(forKey: Keys.caregiverName) ?? "Katie"
        self.patientName   = defaults.string(forKey: Keys.patientName)   ?? "Don"
        self.hasCompletedOnboarding = defaults.bool(forKey: Keys.onboarded)
    }

    // MARK: - Actions
    func finishOnboarding() {
        hasCompletedOnboarding = true
        saveProfile()
        log("Onboarding completed for \(caregiverName) & \(patientName)")
    }

    func saveProfile() {
        defaults.set(caregiverName, forKey: Keys.caregiverName)
        defaults.set(patientName,   forKey: Keys.patientName)
        defaults.set(hasCompletedOnboarding, forKey: Keys.onboarded)
    }

    func log(_ text: String) {
        events.append(text)
    }
}
