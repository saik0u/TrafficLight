//
//  CarView.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import SwiftUI

struct CarView<ViewModel: CarViewModelProtocol>: View {

    @ObservedObject private var viewModel: ViewModel
    @FocusState private var modelNameFieldFocused: Bool
    @State private var navigateToDrivingView = false

    init(viewModel: ViewModel = CarViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {

                // Model Name Text Field
                TextField("Enter your car model", text: $viewModel.carModelName)
                    .focused($modelNameFieldFocused)
                    .submitLabel(.done)
                    .onSubmit(startDriving)
                    .bordered()

                // Name Counter
                HStack {
                    Spacer()

                    Text("\(viewModel.carModelName.count)")
                        .font(.caption)
                        .foregroundColor(viewModel.isModelNameValid() ? .green : .red)
                        .padding(.trailing)
                }
                .padding(.bottom)

                // Start Driving Button
                Button(action: startDriving) {
                    HStack {
                        Text("Start Driving")
                            .font(.body)
                            .bold()

                        Image(systemName: "car")
                            .resizable()
                            .frame(width: 16, height: 16, alignment: .center)
                    }
                }
                .bordered()
                .disabled(!viewModel.isModelNameValid())
                .navigationDestination(isPresented: $navigateToDrivingView) {
                    DrivingView(carModelName: viewModel.carModelName)
                }

                Spacer()
            }
            .navigationTitle("Car")
            .padding()
        }
    }
}

// MARK: - Event Handlers
extension CarView {

    func startDriving() {

        // Unfocus the text field
        modelNameFieldFocused = false
        
        // Navigate if name is valid
        navigateToDrivingView = viewModel.isModelNameValid()
    }
}

// MARK: - Preview
#Preview {

    CarView()
}
