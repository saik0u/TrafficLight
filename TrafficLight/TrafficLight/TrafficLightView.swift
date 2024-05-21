//
//  TrafficLightView.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import SwiftUI

struct TrafficLightView<ViewModel: TrafficLightViewModelProtocol>: View {

    @ObservedObject private var viewModel: ViewModel

    init(viewModel: ViewModel = TrafficLightViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {

            Circle()
                .foregroundColor(.red)
                .opacity(viewModel.currentColor == .red ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
                .animation(.easeInOut(duration: 0.3), value: viewModel.currentColor)

            Circle()
                .foregroundColor(.orange)
                .opacity(viewModel.currentColor == .orange ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
                .animation(.easeInOut(duration: 0.3), value: viewModel.currentColor)

            Circle()
                .foregroundColor(.green)
                .opacity(viewModel.currentColor == .green ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
                .animation(.easeInOut(duration: 0.3), value: viewModel.currentColor)
        }
        .bordered()
    }
}

// MARK: - Preview
#Preview {

    TrafficLightView()
}
