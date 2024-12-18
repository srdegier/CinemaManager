//
//  ReservationSeatView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 18/12/2024.
//

import SwiftUI

struct ReservationSeatView: View {
    let seat: Seat
    let seatReservation: ReservationSeat?
    let isReserved: Bool

    var body: some View {
        if seatReservation != nil {
            Rectangle()
                .fill(.red)
                .frame(width: 50, height: 50)
                .padding(4)
                .overlay {
                    Text("\(seat.seatNumber)")
                }
        } else {
            Rectangle()
                .fill(isReserved ? .blue : .green)
                .frame(width: 50, height: 50)
                .padding(4)
                .overlay {
                    Text("\(seat.seatNumber)")
                }
        }
    }
}
