//
//  EditRoomView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI
import SwiftData

struct EditRoomView: View {
    @Environment(\.dismiss) private var dismiss
    @State var room: Room

    var body: some View {
        NavigationStack {
            VStack {
                EditRoomLayoutView(room: $room)
            }
            .navigationTitle("Zaal (\(room.roomConfiguration.name))")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}
