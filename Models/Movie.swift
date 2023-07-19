//
//  Movie.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 17/07/2023.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String?
    let year: String?
    let imdbId: String?
    let poster: String?

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
