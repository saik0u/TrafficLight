//
//  CarViewModelTests.swift
//  TrafficLightTests
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import XCTest
@testable import TrafficLight

class CarViewModelTests: XCTestCase {

    var viewModel: CarViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CarViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialCarModelNameIsEmpty() {

        XCTAssertEqual(viewModel.carModelName, "", "Initial car model name should be empty")
    }

    func testCarModelIsNotValid() {

        viewModel.carModelName = "C3"
        XCTAssertFalse(viewModel.isModelNameValid(), "Car model name with less than 3 characters should be invalid")


        viewModel.carModelName = "   "
        XCTAssertFalse(viewModel.isModelNameValid(), "Car model name with less than 3 characters should be invalid")
    }

    func testCarModelIsValid() {

        viewModel.carModelName = "Eos"
        XCTAssertTrue(viewModel.isModelNameValid(), "Car model name with 3 characters should be valid")

        viewModel.carModelName = "Tesla Model Y"
        XCTAssertTrue(viewModel.isModelNameValid(), "Car model name with more than 3 characters should be valid")
    }
}
