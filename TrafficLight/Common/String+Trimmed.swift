//
//  String+Trimmed.swift
//  TrafficLight
//
//  Created by Nikolay Dimitrov on 20.05.24.
//

import Foundation

extension String {

    /// Trims whitespaces and newlines
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
