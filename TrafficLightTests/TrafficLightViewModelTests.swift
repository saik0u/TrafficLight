//
//  TrafficLightViewModelTests.swift
//  TrafficLightTests
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import XCTest
@testable import TrafficLight

class TrafficLightViewModelTests: XCTestCase {

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

    func testStartTrafficLight() async {

        // When
        let viewModel = TrafficLightViewModel(actor: actor, iterations: 0)

        try? await Task.sleep(for: .seconds(0.005))

        // Then
        XCTAssertEqual(viewModel.currentColor, .green, "After start color should be green")
    }

    func testUpdateTrafficLight() async {

        // When
        let viewModel = TrafficLightViewModel(actor: actor, iterations: 1)

        try? await Task.sleep(for: .seconds(0.005))

        // Then
        XCTAssertEqual(viewModel.currentColor, .orange, "After update color should be orange")
    }

    func testUpdate2TrafficLight() async {

        // When
        let viewModel = TrafficLightViewModel(actor: actor, iterations: 2)

        try? await Task.sleep(for: .seconds(0.005))

        // Then
        XCTAssertEqual(viewModel.currentColor, .red, "After two updates color should be red")
    }

    func testCycleTrafficLight() async {

        // When
        let viewModel = TrafficLightViewModel(actor: actor, iterations: 3)

        try? await Task.sleep(for: .seconds(0.007))

        // Then
        XCTAssertEqual(viewModel.currentColor, .green, "After a full cycle color should be green again")
    }
}
