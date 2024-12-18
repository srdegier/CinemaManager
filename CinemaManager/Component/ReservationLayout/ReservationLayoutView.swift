//
//  ReservationLayoutView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct ReservationLayoutView: View {
    @Binding var movieRoom: MovieRoom
    @Binding var reservationRowSeatsPayload: [ReservationRowSeats]

    var body: some View {
        VStack {
            ScreenLayoutView()
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    ForEach($movieRoom.room.rowSeats) { row in
                        ReservationRowView(
                            movieRoom: $movieRoom,
                            rowSeats: row,
                            availableReservationSeats: $reservationRowSeatsPayload
                        )
                    }
                }
            }
        }
        .padding()
    }
}
