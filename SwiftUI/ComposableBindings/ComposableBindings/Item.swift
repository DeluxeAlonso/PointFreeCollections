//
//  Item.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

struct Item {
    var name: String
    var color: Color?
    var status: Status

    enum Status {
        case inStock(quantity: Int)
        case outOfStock(isOnBackOrder: Bool)
    }

    enum Color: String, Hashable, CaseIterable {
        case blue, green, black, red, yellow, white
    }
}
