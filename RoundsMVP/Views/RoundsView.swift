//
//  RoundsView.swift
//  RoundsMVP
//

import SwiftUI

struct RoundsView: View {
    @EnvironmentObject private var app: AppModel

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("👋 Welcome to Rounds")
                        .font(.headline)
                    Text("Caregiver: \(app.caregiverName)")
                    Text("Patient: \(app.patientName)")
                }

                if !app.events.isEmpty {
                    Section("Activity") {
                        ForEach(app.events, id: \.self) { Text($0) }
                    }
                }
            }
            .navigationTitle("Rounds")
        }
    }
}

#Preview {
    RoundsView().environmentObject(AppModel())
}
