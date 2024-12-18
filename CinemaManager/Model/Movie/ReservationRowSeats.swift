//
//  ReservationRowSeats.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 17/12/2024.
//

import SwiftData
import Foundation

@Model
class ReservationRowSeats {
    public var UUid: UUID
    public var rowNumber: Int?
    public var seats: [ReservationSeat]

    init(UUid: UUID, rowNumber: Int? = nil, seats: [ReservationSeat]) {
        self.UUid = UUid
        self.rowNumber = rowNumber
        self.seats = seats
    }
}
