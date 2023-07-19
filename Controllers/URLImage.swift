//
//  URLImage.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 17/07/2023.
//


import SwiftUI

struct URLImage: View {
    let url: String
    let placeHolder: String
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String, placeHolder: String) {
        self.url = url
        self.placeHolder = placeHolder
        self.imageLoader = ImageLoader()
        self.imageLoader.download(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image(systemName: self.placeHolder).resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    
    static var previews: some View {
        URLImage(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg", placeHolder: "noname")
    }
}
