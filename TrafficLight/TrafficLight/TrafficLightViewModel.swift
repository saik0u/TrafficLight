//
//  TrafficLightViewModel.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import Foundation

protocol TrafficLightViewModelProtocol: ObservableObject {

    init(actor: TrafficLightActorProtocol, iterations: Int)
    var currentColor: LightColor { get }
}

class TrafficLightViewModel: TrafficLightViewModelProtocol {

    @Published var currentColor: LightColor = .green

    private let actor: TrafficLightActorProtocol
    private let iterations: Int

    required init(actor: TrafficLightActorProtocol = TrafficLightActor(), iterations: Int = Int.max) {
        self.actor = actor
        self.iterations = iterations

        startTrafficLight()
    }

    private func startTrafficLight() {

        let lightStream = updateTrafficLight()

        Task {
            // Consume the values from the stream
            for try await color in lightStream {

                // Update the color on the main thread
                await MainActor.run {
                    currentColor = color
                }
            }
        }
    }

    private func updateTrafficLight() -> AsyncStream<LightColor> {

        // Create a stream that continuously updates traffic light colors
        let lightStream = AsyncStream<LightColor> { continuation in
            Task {
                for _ in 0 ..< iterations {

                    await actor.updateColor()

                    // Emit value to the stream
                    await continuation.yield(actor.getCurrentColor())
                }

                // End the stream
                continuation.finish()
            }
        }

        return lightStream
    }
}
