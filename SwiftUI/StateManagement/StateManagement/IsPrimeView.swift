//
//  IsPrimeView.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import SwiftUI

struct IsPrimeView: View {
    @ObservedObject var state: AppState

    var body: some View {
        VStack {
            if isPrime(state.count) {
                Text("\(state.count) is prime")
                if state.favoritePrimes.contains(state.count) {
                    Button(action: {
                        state.removeFavoritePrime()
                    }) {
                        Text("Remove from favorite pimes")
                    }
                } else {
                    Button(action: {
                        state.addFavoritePrime()
                    }) {
                        Text("Save to favorite pimes")
                    }
                }
            } else {
                Text("\(state.count) is not prime")
            }
        }
    }

    private func isPrime(_ n: Int) -> Bool {
        guard n > 1 else { return false }
        guard n > 3 else { return true }
        for i in 2...Int(sqrt(Float(n))) {
            if n % i == 0 { return false }
        }
        return true
    }
}

struct IsPrimeView_Previews: PreviewProvider {
    static var previews: some View {
        IsPrimeView(state: AppState())
    }
}
