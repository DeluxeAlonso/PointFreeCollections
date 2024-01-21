//
//  Binding+Unwrap.swift
//  ComposableBindings
//
//  Created by Alonso on 20/01/24.
//

import SwiftUI

extension Binding {
    func unwrap<Wrapped>() -> Binding<Wrapped>? where Value == Wrapped? {
        guard let value = wrappedValue else { return nil }
        return Binding<Wrapped>(get: { value }, set: { self.wrappedValue = $0 })
    }

    func matching<Case>(extract: @escaping (Value) -> Case?, embed: @escaping (Case) -> Value) -> Binding<Case>? {
        guard let `case` = extract(wrappedValue) else { return nil }
        return Binding<Case>(get: { `case` }, set: { `case` in self.wrappedValue = embed(`case`) })
    }
}
