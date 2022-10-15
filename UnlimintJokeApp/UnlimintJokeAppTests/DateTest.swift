//
//  DateTest.swift
//  UnlimintJokeAppTests
//
//  Created by Muzaffar on 15/10/22.
//

import XCTest
@testable import UnlimintJokeApp

final class DateTest: XCTestCase {

    var currentDate: Date?
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        currentDate = Date()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
        currentDate = nil
    }

    func testScoreIsComputedWhenGuessIsHigherThanTarget() {
        
        // given
        guard let guess = currentDate?.convertLocalDate() else {return }
        
        // when
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        let date = dateFormatter.date(from:guess)
        
        // then
        XCTAssertEqual(currentDate?.description,date?.description, "Score computed from guess is wrong")
    }
}
