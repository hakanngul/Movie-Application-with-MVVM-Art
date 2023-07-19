//
//  String+Extensions.swift
//  MovieAppMVVM
//
//  Created by Hakan Gül on 19/07/2023.
//

import Foundation


extension String {
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
