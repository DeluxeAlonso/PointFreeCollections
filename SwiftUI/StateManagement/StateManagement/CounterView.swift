//
//  CounterView.swift
//  StateManagement
//
//  Created by Alonso on 6/01/24.
//

import SwiftUI

struct CounterView: View {
    // Life cycle of state variables mirrors the view life cycle
    @State var count = 0

    var body: some View {
        VStack {
            HStack {
                Button(action: { count -= 1 }) {
                    Text("-")
                }
                Text("\(count)")
                Button(action: { count += 1 }) {
                    Text("+")
                }
            }
            Button(action: {}) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(ordinal(count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
    }

    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
