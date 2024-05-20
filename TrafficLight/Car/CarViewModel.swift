//
//  CarViewModel.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import Foundation

protocol CarViewModelProtocol: ObservableObject {

    var carModelName: String { get set }
    func isModelNameValid() -> Bool
}

class CarViewModel: CarViewModelProtocol {

    @Published var carModelName: String = ""

    func isModelNameValid() -> Bool {
        carModelName.trimmed().count >= 3
    }
}
