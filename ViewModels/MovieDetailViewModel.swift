//
//  MovieDetailViewModel.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 20/07/2023.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HttpClient()
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailByImdbId(imdbId: String) {
        httpClient.getMovieDetailBy(imdbId: imdbId) { result in
            switch result {
                case .success(let details):
                    DispatchQueue.main.async {
                        self.movieDetail = details
                        self.loadingState = .success
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
            }
        }
    }
        
    var title: String {
        movieDetail?.title ?? ""
    }
    
    var plot: String {
        movieDetail?.plot ?? ""
    }

    var poster: String {
        movieDetail?.poster ?? ""
    }
    
    var director: String {
        movieDetail?.director ?? ""
    }
    
    var rating: Int {
        let ratingAsDouble = Double(movieDetail?.imdbRating ?? "0.0")
        return Int(ceil(ratingAsDouble ?? 0.0))
    }
}
