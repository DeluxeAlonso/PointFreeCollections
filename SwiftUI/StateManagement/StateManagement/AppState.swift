//
//  AppState.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import Combine
import Foundation

final class AppState: ObservableObject {
    @Published var count: Int = 0
    @Published var favoritePrimes: [Int] = []
    @Published var activityFeed: [Activity] = []

    func addFavoritePrime() {
        self.favoritePrimes.append(self.count)
        self.activityFeed.append(Activity(timestamp: Date(), type: .addedFavoritePrime(self.count)))
    }

    func removeFavoritePrime(_ prime: Int) {
        self.favoritePrimes.removeAll(where: { $0 == prime })
        self.activityFeed.append(Activity(timestamp: Date(), type: .removedFavoritePrime(prime)))
    }

    func removeFavoritePrime() {
        self.removeFavoritePrime(self.count)
    }

    func removeFavoritePrimes(at indexSet: IndexSet) {
        for index in indexSet {
            self.removeFavoritePrime(self.favoritePrimes[index])
        }
    }
}
