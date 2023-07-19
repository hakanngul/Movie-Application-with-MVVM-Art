//
//  MovieViewModel.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation

struct MovieViewModel {
    let movie: Movie
    var imdbId: String {
        movie.imdbId!
    }

    var title: String {
        movie.title!
    }
    
    var year: String {
        movie.year!
    }
    
    var poster: String {
        movie.poster!
    }
}
