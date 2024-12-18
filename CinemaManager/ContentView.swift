//
//  ContentView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 15/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Films", systemImage: "popcorn")
                }
            RoomsView()
                .tabItem {
                    Label("Zalen", systemImage: "chair.lounge")
                }
        }
    }
}

#Preview {
    ContentView()
}
