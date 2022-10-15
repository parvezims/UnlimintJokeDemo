//
//  JokeCDMManager.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//

import Foundation

struct JokeCDMManager {
    
    private let _jokeDataRepo = JokeCDMRepositoryFile()
    
    func createJokeCDM(joke: Joke) {
        _jokeDataRepo.createJoke(joke: joke)
    }
    
    func fetchJokeCDM() -> [Joke]? {
        return _jokeDataRepo.fetchAll()
    }
    
    func fetchJokeCDM(byIdentifier id: UUID) -> Joke? {
        return _jokeDataRepo.get(byIdentifier: id)
    }
    
    func deleteJokeCDM(record: Joke) -> Bool {
        return _jokeDataRepo.delete(record: record)
    }
}
