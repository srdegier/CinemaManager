//
//  RowSeats.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 17/12/2024.
//

import SwiftData
import Foundation

@Model
class RowSeats {
    public var id: UUID = UUID()

    public var index: Int
    public var rowNumber: Int?
    public var seats: [Seat]
    public var rowType: RowType

    init(index: Int, rowNumber: Int?, seats: [Seat], rowType: RowType) {
        self.index = index
        self.rowNumber = rowNumber
        self.seats = seats
        self.rowType = rowType
    }
}
