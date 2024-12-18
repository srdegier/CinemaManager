//
//  AddReservationView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 18/12/2024.
//

import SwiftUI

struct AddReservationView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding var movieRoom: MovieRoom
    @Binding var reservationRowSeatsPayload: [ReservationRowSeats]

    @State private var amountToReserve: Int = 0

    var body: some View {
        VStack {
            List {
                HStack {
                    Stepper(value: $amountToReserve, in: 0...100) {
                        Text("Stoelen: \(amountToReserve)")
                    }
                    Button("Zoeken") {
                        reservationRowSeatsPayload.removeAll()
                        searchSeats()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(amountToReserve == 0)
                }
            }
            Button(action: {
                let newReservedRowSeats = Array(Set(reservationRowSeatsPayload + movieRoom.reservedRowSeats))
                movieRoom.reservedRowSeats = newReservedRowSeats
                reservationRowSeatsPayload.removeAll()
                dismiss()
            }) {
              Text("Reservering opslaan")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            }
            .padding()
        }
    }

    private func searchSeats() {
        let validRows = movieRoom.room.rowSeats.filter { $0.rowType != .empty }
        let reservedRowSeats = movieRoom.reservedRowSeats
        let reservedSeatsUUIDs = reservedRowSeats.flatMap { $0.seats.map { $0.UUid } }

        // zoek voor het aantal nodige stoelen in paar
        searchPairSeats(for: validRows, reservedSeatsUUIDs: reservedSeatsUUIDs)
    }

    private func searchPairSeats(for validRows: [RowSeats], reservedSeatsUUIDs: [UUID]) {
        let neededSeats = amountToReserve
        for row in validRows {
            let sortedSeats = row.seats.sorted { $0.seatIndex < $1.seatIndex }
            var reservationSeats: [ReservationSeat] = []
            var lastSeatIndex: Int? = nil

            for seat in sortedSeats {
                if reservedSeatsUUIDs.contains(seat.UUId) {
                    reservationSeats.removeAll()
                    lastSeatIndex = nil
                    continue
                }

                if let lastIndex = lastSeatIndex, lastIndex + 1 != seat.seatIndex {
                    reservationSeats.removeAll()
                }

                reservationSeats.append(ReservationSeat(UUid: seat.UUId, seatNumber: seat.seatNumber))
                lastSeatIndex = seat.seatIndex

                if reservationSeats.count == neededSeats {
                    reservationRowSeatsPayload.append(
                        ReservationRowSeats(UUid: row.id, rowNumber: row.rowNumber, seats: reservationSeats)
                    )
                    return
                }
            }
        }
        // Als er geen aaneengesloten stoelen gevonden, 1 voor 1 toewijzen
        searchEmptySeats(for: validRows, reservedSeatsUUIDs: reservedSeatsUUIDs)
    }

    private func searchEmptySeats(for validRows: [RowSeats], reservedSeatsUUIDs: [UUID]) {
        var remainingSeats = amountToReserve

        for row in validRows {
            for seat in row.seats.sorted(by: { $0.seatIndex < $1.seatIndex }) {
                if reservedSeatsUUIDs.contains(seat.UUId) { continue }

                reservationRowSeatsPayload.append(
                    ReservationRowSeats(UUid: row.id, rowNumber: row.rowNumber, seats: [ReservationSeat(UUid: seat.UUId, seatNumber: seat.seatNumber)])
                )
                remainingSeats -= 1

                if remainingSeats == 0 { return }
            }
        }
    }
}
