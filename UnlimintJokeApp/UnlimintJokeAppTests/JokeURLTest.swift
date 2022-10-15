//
//  JokeURLTest.swift
//  UnlimintJokeAppTests
//
//  Created by Muzaffar on 15/10/22.
//

import XCTest
@testable import UnlimintJokeApp

final class JokeURLTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testApiCallCompletes() throws {
        
        let parameter = "format=json"
        let endPoint = APIEndpoints.getJokesURL(with: parameter)
        XCTAssertEqual(endPoint, "https://geek-jokes.sameerkumar.website/api?format=json")
        
        NetworkService.shared.dataRequest(with: endPoint, objectType: Joke.self) { [weak self] (result: Result) in
            
            if self != nil {
                switch result {
                case .success(let object):
                    XCTAssertNil(object)
                case .failure(_):
                    XCTAssertThrowsError("Some Error occured")
                }
            }
        }
    }
}
