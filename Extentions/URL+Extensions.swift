//
//  URL+Extensions.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation

extension URL {
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "\(Constants.BASE_URL)/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "\(Constants.BASE_URL)/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
}
