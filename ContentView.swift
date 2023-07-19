//
//  ContentView.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 17/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .onAppear {
                HttpClient().getMoviesBy(search: "superman") { result in
                    switch result {
                        case .success(let movies):
                            print(movies!)
                        case .failure(let error):
                            print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
