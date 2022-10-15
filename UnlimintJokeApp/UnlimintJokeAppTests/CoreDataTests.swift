//
//  CoreDataTests.swift
//  UnlimintJokeAppTests
//
//  Created by Muzaffar on 15/10/22.
//

import XCTest
@testable import UnlimintJokeApp


final class CoreDataTests: XCTestCase {

    
    var jokeDataManager:JokeDataManager?

    override func setUpWithError() throws {
        
        jokeDataManager = JokeDataManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJokeDataManager() {
    
        for i in 1...15 {
            let joke = Joke(id: UUID(), date: Date(), joke: "Joke\(i)" )
            jokeDataManager?.createJoke(joke: joke)
            jokeDataManager?.deleteIfRequired()
            XCTAssert(jokeDataManager?.jokes.count ?? 0 <= 10)
        }
    }
}
