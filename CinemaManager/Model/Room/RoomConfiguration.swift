//
//  RoomConfiguration.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftData

@Model
class RoomConfiguration {
    public var name: String
    public var maxSeatsPerRow: Int

    init(name: String, maxSeatsPerRow: Int) {
        self.name = name
        self.maxSeatsPerRow = maxSeatsPerRow
    }
}
