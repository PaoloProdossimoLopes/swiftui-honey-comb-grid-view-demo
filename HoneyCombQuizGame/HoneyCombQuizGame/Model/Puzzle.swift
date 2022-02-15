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
    
    var letters: [Letters] = []
}

struct Letters: Identifiable {
    let id: String = UUID().uuidString
    
    let value: String
}

var puzzlesMock: [Puzzle] = [
    .init(imageName: "crown", awnser: "crown", jumbbleWord: "cradownasd".uppercased()),
    .init(imageName: "naruto", awnser: "naruto", jumbbleWord: "NFSAFSRUTDSFO".uppercased()),
    .init(imageName: "goku", awnser: "goku", jumbbleWord: "FSGODKUFS".uppercased()),
    .init(imageName: "Minion", awnser: "minion", jumbbleWord: "MSFINSFIOFN".uppercased()),
]
