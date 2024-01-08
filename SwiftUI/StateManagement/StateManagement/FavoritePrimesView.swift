//
//  FavoritePrimesView.swift
//  StateManagement
//
//  Created by Alonso on 7/01/24.
//

import SwiftUI

struct FavoritePrimesView: View {
    @ObservedObject var state: FavoritePrimesState

    var body: some View {
        List {
            ForEach(state.favoritePrimes) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                state.removeFavoritePrimes(at: indexSet)
            }
        }
        .navigationTitle(Text("Favorite Primes"))
    }
}

struct FavoritePrimesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePrimesView(state: FavoritePrimesState(state: AppState()))
    }
}
