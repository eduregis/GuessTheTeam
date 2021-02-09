//
//  GuessTheTeamTests.swift
//  GuessTheTeamTests
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import XCTest
@testable import GuessTheTeam

class GuessTheTeamTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // TESTS IN VIEWCODE CONTROLLERS
    
    func testFieldView() throws {
        // given
        let fieldController = FieldController()
        let fieldView = FieldView()
        // when
        XCTAssert(type(of: fieldController.fieldView) == type(of: fieldView))
    }
    
    func testFeedbackView() throws {
        // given
        let feedbackController = FeedbackController()
        let label = UILabel()
        // when
        XCTAssert(type(of: feedbackController.highscoreLabel) == type(of: label))
    }
    
    func testHomeView() throws {
        // given
        let homeController = HomeController()
        let button = UIButton()
        // when
        XCTAssert(type(of: homeController.customButton) == type(of: button))
    }

    // TEST IN FUNCTIONS
    
    func testSecondsToMinutedSeconds() {
        // given
        let fieldController = FieldController()
        let input = 301
        // when
        let output = fieldController.secondsToMinutedSeconds(seconds: input)
        // then
        XCTAssertEqual(output.0, 5)
        XCTAssertEqual(output.1, 1)
    }
    
    func testMakeTimeString() {
        // given
        let fieldController = FieldController()
        let inputMinutes = 2
        let inputSeconds = 30
        // when
        let output = fieldController.makeTimeString(minutes: inputMinutes, seconds: inputSeconds)
        // then
        XCTAssertEqual(output, "       2:30")
    }
    
    func testFieldView_mainButton() {
        // given
        let fieldController = FieldController()
        // when
        let mainButton = fieldController.mainButton()
        // then
        XCTAssert(mainButton)
    }
    
    func testFieldView_confirmName() {
        // given
        let fieldController = FieldController()
        // when
        let confirmName = fieldController.confirmName()
        // then
        XCTAssert(confirmName)
    }
    
    func testFieldView_showInfo() {
        // given
        let fieldController = FieldController()
        // when
        let showInfo = fieldController.showInfo()
        // then
        XCTAssert(showInfo)
    }
    
    func testFieldView_dismissAlert() {
        // given
        let fieldController = FieldController()
        // when
        let dismissAlert = fieldController.dismissAlert()
        // then
        XCTAssert(dismissAlert)
    }
    
    func testFieldView_timerCounter() {
        // given
        let fieldController = FieldController()
        // when
        let timerCounter = fieldController.timerCounter()
        // then
        XCTAssert(timerCounter)
    }
    
    // TESTS IN EXTENSIONS
    
    func testShake()  {
        //given
        let view = UIView()
        var thrownError: Error?
        // when
        XCTAssertThrowsError(try view.shake(count: 0, for: 0.5, withTranslation: 2)) {
            thrownError = $0
        }
    }
}
