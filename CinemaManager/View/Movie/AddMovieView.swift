//
//  AddMovieView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI
import SwiftData

struct AddMovieView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Query private var rooms: [Room]

    @State private var movieTitle: String = ""
    @State private var selectedRoom: Room?
    @State private var randomReservedSeats: Int = 0
    @State private var maxReserverdSeats: Int = 0

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    TextField("Film naam", text: $movieTitle)
                    Picker("Room", selection: $selectedRoom) {
                        ForEach(rooms, id: \.id) { room in
                            Text(room.roomConfiguration.name)
                                .tag(room)
                        }
                    }
                    .onChange(of: selectedRoom) { oldValue, newValue in
                        determineMaxReserveredSeats()
                    }

                    Stepper(value: $randomReservedSeats, in: 0...maxReserverdSeats) {
                        Text("Gereserveerde stoelen: \(randomReservedSeats)")
                    }

                    .pickerStyle(MenuPickerStyle())
                }
            }
            .onAppear {
                selectedRoom = rooms.first
            }
            .navigationTitle("Film toevoegen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Opslaan") {
                        saveMovie()
                    }
                    .disabled(movieTitle.isEmpty)
                }
            }
        }
    }

    private func determineMaxReserveredSeats() {
        if let totalSeats = selectedRoom?.rowSeats.flatMap(\.seats).count {
            let randomSeats = totalSeats / 2

            randomReservedSeats = randomSeats
            maxReserverdSeats = randomSeats
        }
    }

    private func saveMovie() {
        if let room = selectedRoom {
            let movieRoom = MovieRoom(room: room, reservedRowSeats: randomizeSeats())
            let movie = Movie(title: movieTitle, movieRoom: movieRoom)
            modelContext.insert(movie)
            dismiss()

        }
    }

    private func randomizeSeats() -> [ReservationRowSeats] {
        var randomTokens: Int = randomReservedSeats
        var movieSeats: [ReservationRowSeats] = []

        if let rowSeats = selectedRoom?.rowSeats {
            for rowSeat in rowSeats {
                if randomTokens <= 0 {
                    break
                }

                if rowSeat.rowType == .empty {
                    continue
                }

                let maxSeatsForRow = min(rowSeat.seats.count, randomTokens)

                let seats = Array(rowSeat.seats.shuffled().prefix(maxSeatsForRow))

                var newSeats: [ReservationSeat] = []
                for seat in seats {
                    let newSeat = ReservationSeat(
                        UUid: seat.UUId,
                        seatNumber: seat.seatNumber
                    )
                    newSeats.append(newSeat)
                }

                let newReservationRowSeats = ReservationRowSeats(UUid: rowSeat.id, rowNumber: rowSeat.rowNumber, seats: newSeats)

                movieSeats.append(newReservationRowSeats)
                randomTokens -= seats.count
            }
        }

        return movieSeats
    }

}
