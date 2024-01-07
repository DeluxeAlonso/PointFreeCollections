//
//  CounterView.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var state: AppState
    @State var isPrimeModalShown: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: { state.count -= 1 }) {
                    Text("-")
                }
                Text("\(state.count)")
                Button(action: { state.count += 1 }) {
                    Text("+")
                }
            }
            Button(action: { isPrimeModalShown = true }) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(ordinal(state.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeModalShown) {
            IsPrimeView(state: state)
        }
    }

    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
