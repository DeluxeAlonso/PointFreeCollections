//
//  FavoritePrimesView.swift
//  StateManagement
//
//  Created by Alonso on 7/01/24.
//

import SwiftUI

struct FavoritePrimesView: View {
    @ObservedObject var state: AppState

    var body: some View {
        List {
            ForEach(state.favoritePrimes) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                for index in indexSet {
                    state.favoritePrimes.remove(at: index)
                }
            }
        }
        .navigationTitle(Text("Favorite Primes"))
    }
}

struct FavoritePrimesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePrimesView(state: AppState())
    }
}
