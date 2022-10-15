//
//  JokeDataManager.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//

import Foundation

class JokeDataManager {
    
    var jokes = [Joke]()
    let jokeCDManager = JokeCDMManager()

    func createJoke(joke: Joke) {
        
        if let alljoke = jokeCDManager.fetchJokeCDM() {
            print(alljoke.count)
        }
        jokeCDManager.createJokeCDM(joke: joke)
        jokes.insert(joke, at:0)
    }

    func deleteIfRequired() {
        
        if (jokes.count > Constant.maxJokeLength) {
            if let lastObj = jokes.last {
                if jokeCDManager.deleteJokeCDM(record: lastObj) == true {
                    jokes.removeLast()
                }
            }
        }
    }
    
    func getExistingData() -> [Joke]? {
        
        jokes.removeAll()
        if let data = jokeCDManager.fetchJokeCDM() {
            jokes.append(contentsOf: data)
            return jokes
        }
        return nil
    }
}
