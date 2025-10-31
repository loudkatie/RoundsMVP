//
//  RoundSession.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import Foundation

struct RoundSession: Identifiable, Codable, Hashable {
    var id: UUID = .init()
    var startedAt: Date = .init()
    var title: String
    var notes: [CareNote] = []
}
