//
//  MovieDetailScreen.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 20/07/2023.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()

    var body: some View {
        VStack {
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
        }
        .onAppear {
            self.movieDetailVM.getDetailByImdbId(imdbId: self.imdbId)
        }
    }
}

// struct MovieDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailScreen()
//    }
// }
