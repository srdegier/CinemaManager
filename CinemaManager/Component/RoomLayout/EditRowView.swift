//
//  EditRowView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct EditRowView: View {
    let maxSeatsPerRow: Int
    @Binding var rowSeats: RowSeats

    var body: some View {
        HStack {
            ForEach(0..<maxSeatsPerRow, id: \.self) { index in
                EditSeatView(
                    seatNumber: getSeatNumber(forSeatIndex: index),
                    isSelected: Binding(
                        get: { determineIsSelected(for: index) },
                        set: { isSelected in
                            updateRow(for: index, isSelected: isSelected)
                            updateRowType()
                        }
                    )
                )
            }
        }
    }

    private func updateRow(for index: Int, isSelected: Bool) {
        if !isSelected {
            rowSeats.seats.removeAll { $0.seatIndex == index }
        } else {
            if !rowSeats.seats.contains(where: { $0.seatIndex == index }) {
                rowSeats.seats.append(Seat(seatIndex: index, seatNumber: 0, status: .empty))
            }
        }

        rowSeats.seats.sort { $0.seatIndex < $1.seatIndex }

        for (seatNumber, seat) in rowSeats.seats.enumerated() {
            seat.seatNumber = seatNumber + 1
        }
    }
    

    private func determineIsSelected(for index: Int) -> Bool {
        return rowSeats.seats.contains { $0.seatIndex == index }
    }

    private func updateRowType() {
        rowSeats.rowType = rowSeats.seats.isEmpty ? .empty : .available
    }

    private func getSeatNumber(forSeatIndex seatIndex: Int) -> Int? {
        if let seat = rowSeats.seats.first(where: { $0.seatIndex == seatIndex }) {
            return seat.seatNumber
        }
        return nil
    }

}
