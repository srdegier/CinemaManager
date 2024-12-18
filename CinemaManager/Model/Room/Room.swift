//
//  Room.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftData
import Foundation

@Model
class Room {
    public var roomConfiguration: RoomConfiguration
    public var rowSeats: [RowSeats]

    init(roomConfiguration: RoomConfiguration, rowSeats: [RowSeats]) {
        self.roomConfiguration = roomConfiguration
        self.rowSeats = rowSeats
    }
}
