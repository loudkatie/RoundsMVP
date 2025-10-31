//
//  Caregiver.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import Foundation

struct Caregiver: Identifiable, Codable, Hashable {
    var id: UUID = .init()
    var name: String
    var relationship: String? // e.g. “daughter”
}
