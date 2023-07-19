//
//  MovieListViewModel.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation


class MovieListViewModel: ViewModelBase {
    @Published var movies: [MovieViewModel] = [MovieViewModel]()
    let httpClient = HttpClient()
    
    func searchByName(_ name:String) {
        if name.isEmpty {
            return
        }
        
        self.loadingState = .loading
        
        httpClient.getMoviesBy(search: name.trimmedAndEscaped()) { result in
            switch result {
                case .success(let movies):
                    if let movies = movies {
                        DispatchQueue.main.async {
                            self.movies = movies.map(MovieViewModel.init)
                            self.loadingState = .success
                        }
                    }
                    
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
                    print(error.localizedDescription)
            }
        }
    }
}
