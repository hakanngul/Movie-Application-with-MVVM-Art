//
//  View+Extensions.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation
import SwiftUI


extension View {
    func embedNavigationView() -> some View {
        return NavigationView{self}
    }
}
