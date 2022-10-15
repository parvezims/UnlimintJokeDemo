//
//  APIEndpoints.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation


struct APIEndpoints {
    
    static func getJokesURL(with parameter: String) -> String {
        return "https://geek-jokes.sameerkumar.website/api?\(parameter)"
    }
}
