//
//  DrivingView.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import SwiftUI

struct DrivingView: View {

    let carModelName: String

    var body: some View {
        VStack {

            Text("You are driving a \(carModelName)")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            TrafficLightView()

            Spacer()
        }
        .navigationTitle("Driving")
        .padding()
    }
}

// MARK: - Preview
#Preview {

    DrivingView(carModelName: "Golf")
}
