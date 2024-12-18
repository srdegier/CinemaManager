//
//  AddRoom.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftUI

struct AddRoom: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var room: Room
    let onCompletion: () -> Void

    var body: some View {
        NavigationStack {
            EditRoomLayoutView(
                room: $room
            )
        }
        .navigationTitle("Zaal layout")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Opslaan") {
                    saveRoom()
                }
                .disabled(room.rowSeats.isEmpty)
            }
        }
    }

    private func saveRoom() {
        updateRowNumbers()
        let newRoom = room
        modelContext.insert(newRoom)
        onCompletion()
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
    
}
