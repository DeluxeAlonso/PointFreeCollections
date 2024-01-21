//
//  Binding+Map.swift
//  ComposableBindings
//
//  Created by Alonso on 20/01/24.
//

import SwiftUI

extension Binding {
  func map<LocalValue>(
    _ keyPath: WritableKeyPath<Value, LocalValue>
  ) -> Binding<LocalValue> {

    self[dynamicMember: keyPath]
  }
}
