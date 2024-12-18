//
//  Seat.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftData
import Foundation

@Model
class Seat {
    public var UUId: UUID = UUID()
    public var seatIndex: Int
    public var seatNumber: Int
    public var status: SeatStatus

    init(seatIndex: Int, seatNumber: Int, status: SeatStatus) {
        self.seatIndex = seatIndex
        self.seatNumber = seatNumber
        self.status = status
    }
}
