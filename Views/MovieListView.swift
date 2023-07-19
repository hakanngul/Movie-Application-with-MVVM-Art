//
//  MovieListView.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]

    var body: some View {
        List(movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId), label: {
                MovieCell(movie: movie)
            })
        }
    }
}

struct MovieCell: View {
    let movie: MovieViewModel
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster, placeHolder: "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }
    }
}
