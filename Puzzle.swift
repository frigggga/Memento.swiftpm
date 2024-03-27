//
//  Puzzle.swift
//  Memento
//
//  Created by Zhang on 2024/2/25.
//

import Foundation

class Puzzle: Codable {
    var title: String
    var solvedImages: [String]
    var unsolvedImages: [String]
    
    init(title: String, solvedImages: [String]) {
        self.title = title
        self.solvedImages = solvedImages
        self.unsolvedImages = self.solvedImages.shuffled()
    }
}
