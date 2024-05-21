//
//  TrafficLightActor.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import Foundation

protocol TrafficLightActorProtocol {

    func getCurrentColor() async -> LightColor
    func updateColor() async
}

actor TrafficLightActor: TrafficLightActorProtocol {

    private let lightSequence: [LightColor] = [.green, .orange, .red]
    private var currentIndex = 0
    private let shortLightDuration: Double
    private let longLightDuration: Double

    init(shortLightDuration: Double = 1, longLightDuration: Double = 4) {
        self.shortLightDuration = shortLightDuration
        self.longLightDuration = longLightDuration
    }

    func getCurrentColor() async -> LightColor {
        lightSequence[currentIndex]
    }

    func updateColor() async {

        // Sleep to emulate the light switching
        let sleepDuration = await getCurrentColor() == .orange ? shortLightDuration : longLightDuration
        try? await Task.sleep(for: .seconds(sleepDuration))

        // Increment the color index
        currentIndex = (currentIndex + 1) % lightSequence.count
    }
}
