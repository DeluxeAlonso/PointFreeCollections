//
//  FavoritePrimesState.swift
//  StateManagement
//
//  Created by Alonso on 7/01/24.
//

import Combine
import Foundation

final class FavoritePrimesState: ObservableObject {

    private let state: AppState

    init(state: AppState) {
        self.state = state
    }

    var objectWillChange: ObservableObjectPublisher {
        state.objectWillChange
    }

    var favoritePrimes: [Int] {
        get {
            state.favoritePrimes
        }
        set {
            state.favoritePrimes = newValue
        }
    }

    var activityFeed: [Activity] {
        get {
            state.activityFeed
        }
        set {
            state.activityFeed = newValue
        }
    }

    func removeFavoritePrimes(at indexSet: IndexSet) {
        state.removeFavoritePrimes(at: indexSet)
    }
}
