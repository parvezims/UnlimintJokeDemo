//
//  JokeCDMRepositoryFile.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//

import Foundation
import CoreData

protocol JokeCDMRepository {
    func createJoke(joke: Joke)
    func fetchAll() -> [Joke]?
    func get(byIdentifier: UUID) -> Joke?
    func delete(record: Joke) -> Bool
}

struct JokeCDMRepositoryFile : JokeCDMRepository {
    
    func createJoke(joke: Joke) {
        let cdjoke = JokeCDM(context: CoreDataStorage.shared.context)
        cdjoke.date = joke.date
        cdjoke.id = joke.id
        cdjoke.joke = joke.joke
        CoreDataStorage.shared.saveContext()
    }
    
    func fetchAll() -> [Joke]? {
        
        let results = CoreDataStorage.shared.fetchManagedObject(managedObject: JokeCDM.self)
        var jokes:[Joke] = []
        results?.forEach({ joke  in
            jokes.append(joke.convertToJoke())
        })
        return jokes.reversed()
    }
    
    func get(byIdentifier id: UUID) -> Joke? {
        let result = fetchJokeCDM(byIdentifier: id)
        guard result != nil else { return nil }
        return result?.convertToJoke()
    }
    
    func delete(record: Joke) -> Bool {
        
        if let uid = record.id {
            let cdjoke = fetchJokeCDM(byIdentifier: uid)
            guard cdjoke != nil else { return false }
            CoreDataStorage.shared.context.delete(cdjoke!)
            CoreDataStorage.shared.saveContext()
            return true
        }
        return false
    }
    
    private func fetchJokeCDM(byIdentifier id: UUID) -> JokeCDM? {
        
        let fetchRequest = NSFetchRequest<JokeCDM>(entityName: "JokeCDM")
        let predicate = NSPredicate(format: "id=%@", id as CVarArg)
        fetchRequest.predicate = predicate
        
        do {
            let result = try CoreDataStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        }
        catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
