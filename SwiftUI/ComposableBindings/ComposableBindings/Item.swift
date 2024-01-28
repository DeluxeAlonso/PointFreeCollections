//
//  Item.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

import Foundation

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
    }
}
