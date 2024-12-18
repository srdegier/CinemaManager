//
//  ReservationRowView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 18/12/2024.
//

import SwiftUI

struct ReservationRowView: View {
    @Binding var movieRoom: MovieRoom
    @Binding var rowSeats: RowSeats
    @Binding var availableReservationSeats: [ReservationRowSeats]

    private var maxSeatsPerRow: Int { movieRoom.room.roomConfiguration.maxSeatsPerRow }
    private var reservationSeats: [ReservationSeat] { movieRoom.reservedRowSeats.flatMap { $0.seats }}
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxSeatsPerRow, id: \.self) { index in
                if let seat = rowSeats.seats.first(where: { $0.seatIndex == index }) {
                    ReservationSeatView(
                        seat: seat,
                        seatReservation: reservationSeats.first(where: { $0.UUid == seat.UUId } ),
                        isReserved: availableReservationSeats.contains { reservationSeat in
                            reservationSeat.seats.contains { $0.UUid == seat.UUId }
                        }
                    )
                } else {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 50, height: 50)
                        .padding(4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
    }
}
