//
//  MoviesView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI
import SwiftData

struct MoviesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]

    @State private var addMovieToggleSheet: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(destination: ReserveMovieView(movie: movie), label: {                     Text(movie.title)
                        })
                        .swipeActions {
                            Button("Verwijderen", systemImage: "trash", role: .destructive) {
                                modelContext.delete(movie)
                            }
                        }
                    }
                }
            }
            .overlay {
                if movies.isEmpty {
                    ContentUnavailableView {
                        Label("Geen Voorstellingen", systemImage: "popcorn")
                    } description: {
                        Text("Voeg een voorstelling toe om verder te gaan")
                    } actions: {
                        Button("Voorstelling toevoegen") {
                            addMovieToggleSheet.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Unlock Cinema")
            .toolbar {
                Button("Toevoegen") {
                    addMovieToggleSheet.toggle()
                }
            }
            .sheet(isPresented: $addMovieToggleSheet, content: {
                AddMovieView()
            })
        }
    }
}
