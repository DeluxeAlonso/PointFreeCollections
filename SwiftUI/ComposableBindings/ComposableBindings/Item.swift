//
//  Item.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

struct Item {
    var name: String
    var color: Color?

    enum Color: String, Hashable, CaseIterable {
        case blue, green, black, red, yellow, white
    }
}
