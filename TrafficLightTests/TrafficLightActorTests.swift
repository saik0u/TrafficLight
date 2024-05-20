//
//  TrafficLightActorTests.swift
//  TrafficLightTests
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import XCTest
@testable import TrafficLight

class TrafficLightActorTests: XCTestCase {

    var actor: TrafficLightActor!

    override func setUp() {
        super.setUp()

        // Given
        actor = TrafficLightActor(shortLightDuration: 0.001, longLightDuration: 0.001)
    }

    override func tearDown() {
        actor = nil
        super.tearDown()
    }

    func testGetCurrentColor() async {

        // When
        let color = await actor.getCurrentColor()

        // Then
        XCTAssertEqual(color, .green, "Initial color should be green")
    }

    func testUpdateColor() async {

        // When
        await actor.updateColor()

        // Then
        let color = await actor.getCurrentColor()

        XCTAssertEqual(color, .orange, "After update color should be orange")
    }
}
