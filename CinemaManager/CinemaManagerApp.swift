//
//  CinemaManagerApp.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftUI
import SwiftData

@main
struct CinemaManagerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            // movie
            Movie.self,
            MovieRoom.self,
            ReservationSeat.self,
            ReservationRowSeats.self,
            // room
            Room.self,
            RoomConfiguration.self,
            RowSeats.self,
            Seat.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
