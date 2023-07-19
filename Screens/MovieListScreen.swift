//
//  MovieListView.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import SwiftUI

struct MovieListScreen: View {
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    init() {
        self.movieListVM = MovieListViewModel()
//        self.movieListVM.searchByName("superman")
    }

    var body: some View {
        VStack {
            TextField("Search", text: self.$movieName,
                   onCommit: {
                          self.movieListVM.searchByName(self.movieName)
                      })
                      .textFieldStyle(RoundedBorderTextFieldStyle())
                      .background(Color(.systemGray6))
                      .cornerRadius(10)
                      .padding(.horizontal, 10)
                      Spacer(minLength: 5)
                .navigationBarTitle("Movies")
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: self.movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailedView()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView()
            }
            Spacer()
        }.embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
