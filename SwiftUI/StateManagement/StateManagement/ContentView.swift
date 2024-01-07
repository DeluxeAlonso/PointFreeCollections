//
//  ContentView.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var state: AppState

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(state: state)) {
                    Text("Counter demo")
                }
                NavigationLink(destination: FavoritePrimesView(state: state)) {
                    Text("Favorite primes")
                }
            }
            .navigationTitle("State management")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
