//
//  JokeCDM+CoreDataProperties.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//
//

import Foundation
import CoreData


extension JokeCDM {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JokeCDM> {
        return NSFetchRequest<JokeCDM>(entityName: "JokeCDM")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var joke: String?

}

extension JokeCDM : Identifiable {

    func convertToJoke() -> Joke {
        //Joke(joke: self.joke!)
        Joke(id: self.id, date: self.date, joke: self.joke!)
    }
}
