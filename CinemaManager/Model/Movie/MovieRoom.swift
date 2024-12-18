//
//  MovieRoom.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftData
import Foundation

@Model
class MovieRoom {
    public var UUid: UUID = UUID()
    public var room: Room
    public var reservedRowSeats: [ReservationRowSeats]

    init(room: Room, reservedRowSeats: [ReservationRowSeats]) {
        self.room = room
        self.reservedRowSeats = reservedRowSeats
    }
}
