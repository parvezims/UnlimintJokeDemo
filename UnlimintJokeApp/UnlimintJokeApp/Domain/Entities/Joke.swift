//
//  Joke.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation

struct Joke : Decodable, Identifiable {
    
    var id:UUID?
    var date:Date?
    
    let joke: String
    enum codingKeys: String, CodingKey {
        case joke = "joke"
    }
}
