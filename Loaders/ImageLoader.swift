//
//  ImageLoader.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 17/07/2023.
//

import Foundation



class ImageLoader : ObservableObject {
    @Published var downloadedData: Data?
    
    func download(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
