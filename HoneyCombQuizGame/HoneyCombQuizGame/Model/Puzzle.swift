//
//  Puzzle.swift
//  HoneyCombQuizGame
//
//  Created by Paolo Prodossimo Lopes on 15/02/22.
//

import Foundation

struct Puzzle: Identifiable {
    let id: UUID = .init()
    let imageName: String
    let awnser: String
    let jumbbleWord: String
}

var puzzlesMock: [Puzzle] = [
    .init(imageName: "crown", awnser: "crown", jumbbleWord: "crown".uppercased()),
    .init(imageName: "naruto", awnser: "naruto", jumbbleWord: "NARUTO"),
    .init(imageName: "goku", awnser: "goku", jumbbleWord: "GOKU"),
    .init(imageName: "Minion", awnser: "minion", jumbbleWord: "MINION"),
]
