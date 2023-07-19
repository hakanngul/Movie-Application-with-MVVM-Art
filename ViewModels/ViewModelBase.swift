//
//  ViewModelBase.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation

enum LoadingState {
  case  loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
