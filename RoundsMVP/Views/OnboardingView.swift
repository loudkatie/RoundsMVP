//
//  OnboardingView.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var app: AppModel

    @FocusState private var focused: Field?
    @State private var agreedToTerms = false

    enum Field { case caregiver, patient }

    private var canContinue: Bool {
        !app.caregiverName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !app.patientName.trimmingCharacters(in: .whitespaces).isEmpty &&
        agreedToTerms
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack(spacing: 6) {
                    Text("Welcome to Rounds")
                        .font(.largeTitle).fontWeight(.bold)
                    Text("Your ‘doctor-son’ for notes, translation, and coordination — not a diagnostic tool.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                VStack(alignment: .leading, spacing: 14) {
                    Text("Who’s using Rounds?")
                        .font(.headline)

                    LabeledContent("Caregiver name") {
                        TextField("e.g., Katie", text: $app.caregiverName)
                            .textContentType(.name)
                            .submitLabel(.next)
                            .focused($focused, equals: .caregiver)
                            .onSubmit { focused = .patient }
                    }

                    LabeledContent("Patient name") {
                        TextField("e.g., Don", text: $app.patientName)
                            .textContentType(.name)
                            .submitLabel(.done)
                            .focused($focused, equals: .patient)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 10) {
                    Toggle(isOn: $agreedToTerms) {
                        Text("I understand Rounds is informational and not medical advice.")
                    }
                    .toggleStyle(.switch)
                    .accessibilityHint("Required to continue")
                }

                Button(action: completeOnboarding) {
                    Label("Continue", systemImage: "arrow.right.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(!canContinue)

                Spacer()

                Text("You can change names later in Settings.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") { focused = nil }
                }
            }
        }
    }

    private func completeOnboarding() {
        // TODO: We’ll request mic/notifications here in a later step.
        app.finishOnboarding()
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppModel())
}
