//
//  Patient.swift
//  RoundsMVP
//
//  Created by Katie Richman on 10/31/25.
//

import Foundation

struct Patient: Identifiable, Codable, Hashable {
    var id: UUID = .init()
    var name: String
    var mrn: String?   // optional medical record number
    var notes: String? // free text
}
