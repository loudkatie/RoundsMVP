//
//  CareNote.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import Foundation

struct CareNote: Identifiable, Codable, Hashable {
    var id: UUID = .init()
    var timestamp: Date = .init()
    var text: String
    var source: String?   // “voice”, “photo”, “chat”, etc.
}
