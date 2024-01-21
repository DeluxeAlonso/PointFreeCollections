//
//  Binding+Unwrap.swift
//  ComposableBindings
//
//  Created by Alonso on 20/01/24.
//

import CasePaths
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

    func matching<Case>(_ casePath: AnyCasePath<Value, Case>) -> Binding<Case>? {
        guard let `case` = casePath.extract(from: self.wrappedValue) else { return nil }
        return Binding<Case>(
            get: { `case` },
            set: { `case` in self.wrappedValue = casePath.embed(`case`) }
        )
    }

    subscript<Case>(_ casePath: AnyCasePath<Value, Case>) -> Binding<Case>? {
        matching(casePath)
    }
}
