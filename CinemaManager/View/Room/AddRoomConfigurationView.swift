//
//  AddRoomConfigurationView..swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftUI

struct AddRoomConfigurationView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var maxSeatsPerRow: Int = 10

    var body: some View {
        NavigationStack {
            Form {
                TextField("Naam van de zaal", text: $name)
                Stepper(value: $maxSeatsPerRow, in: 4...20) {
                    Text("Max stoelen per rij: \(maxSeatsPerRow)")
                }
            }
            .navigationTitle("Zaal Instellingen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sluiten") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Volgende") {
                        let roomConfiguration = RoomConfiguration(name: name, maxSeatsPerRow: maxSeatsPerRow)
                        AddRoom(
                            room: Room(roomConfiguration: roomConfiguration, rowSeats: []),
                            onCompletion: {
                                dismiss()
                            }
                        )
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
