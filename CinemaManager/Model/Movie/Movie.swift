//
//  Movie.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftData

@Model
class Movie {
    public var title: String
    public var movieRoom: MovieRoom

    init(title: String, movieRoom: MovieRoom) {
        self.title = title
        self.movieRoom = movieRoom
    }
}
