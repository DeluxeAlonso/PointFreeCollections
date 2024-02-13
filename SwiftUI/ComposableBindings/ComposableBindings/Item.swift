//
//  Item.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

import SwiftUI

struct Item: Hashable,Identifiable {
    let id = UUID()
    var name: String
    var color: Color?
    var status: Status

    enum Status: Hashable {
        case inStock(quantity: Int)
        case outOfStock(isOnBackOrder: Bool)

        var isInStock: Bool {
            guard case .inStock = self else { return false }
            return true
        }
    }

    enum Color: String, Hashable, CaseIterable {
        case blue, green, black, red, yellow, white

        var toSwiftUIColor: SwiftUI.Color {
          switch self {
          case .blue:
            return .blue
          case .green:
            return .green
          case .black:
            return .black
          case .red:
            return .red
          case .yellow:
            return .yellow
          case .white:
            return .white
          }
        }
    }
}
