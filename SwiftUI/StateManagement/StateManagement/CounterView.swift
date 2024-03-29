//
//  CounterView.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var state: AppState

    @State var isPrimeModalShown = false
    @State var alertNthPrime: Int?
    @State var isNthPrimeButtonDisabled = false

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
            Button(action: nthPrimeButtonAction) {
                Text("What is the \(ordinal(state.count)) prime?")
            }
            .disabled(isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeModalShown) {
            IsPrimeView(state: state)
        }
        .alert(item: self.$alertNthPrime) { n in
            Alert(title: Text("The \(ordinal(state.count)) prime is \(n)"),
                  dismissButton: Alert.Button.default(Text("OK")))
        }
    }

    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }

    private func nthPrimeButtonAction() {
        isNthPrimeButtonDisabled = true
        nthPrime(state.count) { prime in
            alertNthPrime = prime
            isNthPrimeButtonDisabled = false
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}

extension Int: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return self
    }
}
