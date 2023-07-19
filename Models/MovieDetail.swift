//
//  MovieDetail.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 20/07/2023.
//

import Foundation

struct MovieDetail: Codable {
    var title, year, imdbId, poster: String
    var rated,plot,director,actor,imdbRating : String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actor = "Actors"
        case imdbRating = "imdbRating"
        
    }
}
