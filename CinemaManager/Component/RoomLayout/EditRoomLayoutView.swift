//
//  EditRoomLayoutView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct EditRoomLayoutView: View {
    @Binding var room: Room
    @State var editMode = false

    var body: some View {
        VStack(spacing: 16) {
            ScreenLayoutView()
                .padding()
            if !editMode {
                EditRoomSeatsView(rowSeats: $room.rowSeats, roomConfiguation: room.roomConfiguration)
                    .padding()
            } else {
                EditRoomRowsView(rowSeats: $room.rowSeats)
                    .onAppear {
                        updateRowNumbers()
                    }
            }
            HStack {
                Button("Rij Toevoegen", systemImage: "plus") {
                    addRow()
                }
                Spacer()
                Button("Modus: \(editMode ? "Rijen" : "Stoelen")") {
                    editMode.toggle()
                }
            }
            .padding()
        }
        .onChange(of: room.rowSeats) { _, _ in
            updateRowNumbers()
        }
    }

    private func updateRowNumbers() {
        var rowNumber = 1
        room.rowSeats.forEach { row in
            if row.rowType == .empty {
                row.rowNumber = nil
            } else {
                row.rowNumber = rowNumber
                rowNumber += 1
            }
        }
    }

    private func addRow() {
        room.rowSeats.append(RowSeats(index: -1, rowNumber: nil, seats: [], rowType: .empty))
        updateRowNumbers()
    }

}
