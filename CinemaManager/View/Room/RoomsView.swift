//
//  RoomsView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftUI
import SwiftData

struct RoomsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var rooms: [Room]

    @State private var addRoomToggleSheet: Bool = false
    @State private var editRoomToggleSheet: Bool = false
    @State private var selectedEditRoom: Room? = nil

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(rooms) { room in
                        NavigationLink(destination: EditRoomView(room: room), label: { Text(room.roomConfiguration.name)
                        })
                        .swipeActions {
                            Button("Verwijderen", systemImage: "trash", role: .destructive) {
                                modelContext.delete(room)
                            }
                        }
                    }
                }
            }
            .overlay {
                if rooms.isEmpty {
                    ContentUnavailableView {
                        Label("Geen zalen", systemImage: "chair.lounge")
                    } description: {
                        Text("Voeg een zaal toe om verder te gaan")
                    } actions: {
                        Button("Zaal toevoegen") {
                            addRoomToggleSheet.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Zalen")
            .toolbar {
                Button("Toevoegen") {
                    addRoomToggleSheet.toggle()
                }
            }
            .sheet(isPresented: $addRoomToggleSheet, content: {
                AddRoomConfigurationView()
            })
        }
    }
}

#Preview {
    RoomsView()
}
