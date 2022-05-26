//
//  PokedexHeroesTests.swift
//  PokedexHeroesTests
//
//  Created by Mikel Cobian on 26/5/22.
//

import XCTest
@testable import PokedexHeroes

class PokedexHeroesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testModels() throws {
        let model = Result(id: 345, title: "Esto es una serie", name: "Dragon Ball Z", description: "La mejor serie del mundo", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: Extension.jpg), resourceURI: "djdkdjjfd")
        
        XCTAssertNotNil(model)
        XCTAssertEqual(model.title, "Esto es una serie")
    }

}
