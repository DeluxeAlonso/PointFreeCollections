//
//  AppState.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import Combine

final class AppState: ObservableObject {
    @Published var count: Int = 0
    @Published var favoritePrimes: [Int] = []
}
