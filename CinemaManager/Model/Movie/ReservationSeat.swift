//
//  ReservationSeat.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 17/12/2024.
//

import SwiftData
import Foundation

@Model
class ReservationSeat {
    public var UUid: UUID
    public var seatNumber: Int

    init(UUid: UUID, seatNumber: Int) {
        self.UUid = UUid
        self.seatNumber = seatNumber
    }
}
