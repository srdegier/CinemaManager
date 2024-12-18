//
//  ReserveMovieView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct ReserveMovieView: View {
    @State var movie: Movie
    @State private var toggleMakeReservationSheet: Bool = false
    @State var reservationRowSeatsPayload: [ReservationRowSeats] = []

    var body: some View {
        NavigationStack {
            VStack {
                ReservationLayoutView(
                    movieRoom: $movie.movieRoom,
                    reservationRowSeatsPayload: $reservationRowSeatsPayload
                )
                Button(action: {
                    toggleMakeReservationSheet.toggle()
                }) {
                  Text("Reserveren")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                }
                .padding()

                .sheet(isPresented: $toggleMakeReservationSheet) {
                    AddReservationView(
                        movieRoom: $movie.movieRoom,
                        reservationRowSeatsPayload: $reservationRowSeatsPayload
                    )
                    .presentationDetents([.fraction(0.3)])
                    .presentationDragIndicator(.visible)
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
