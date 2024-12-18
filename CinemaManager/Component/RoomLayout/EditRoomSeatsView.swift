//
//  EditRoomSeatsView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct EditRoomSeatsView: View {
    @Binding var rowSeats: [RowSeats]
    let roomConfiguation: RoomConfiguration

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                ForEach($rowSeats) { $rowSeat in
                    EditRowView(maxSeatsPerRow: roomConfiguation.maxSeatsPerRow, rowSeats: $rowSeat)
                }
            }
        }
    }
}

