//
//  Store.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import Foundation

protocol Store {
    func loadRounds() -> [RoundSession]
    func save(round: RoundSession)
}

final class InMemoryStore: Store {
    static let shared = InMemoryStore()
    private init() {}

    private var _rounds: [RoundSession] = []

    func loadRounds() -> [RoundSession] { _rounds }

    func save(round: RoundSession) {
        if let idx = _rounds.firstIndex(where: { $0.id == round.id }) {
            _rounds[idx] = round
        } else {
            _rounds.append(round)
        }
    }
}
