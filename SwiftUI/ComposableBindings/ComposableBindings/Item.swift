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
        
        var isInStock: Bool {
            guard case .inStock = self else { return false }
            return true
        }

        var isOnBackOrder: Bool {
            get {
              guard case let .outOfStock(isOnBackOrder) = self else {
                return false
              }
              return isOnBackOrder
            }
            set {
                self = .outOfStock(isOnBackOrder: newValue)
            }
        }
        
        var quantity: Int {
            get {
                switch self {
                case .inStock(quantity: let quantity):
                    return quantity
                case .outOfStock:
                    return 0
                }
            }
            set {
                self = .inStock(quantity: newValue)
            }
        }
    }

    enum Color: String, Hashable, CaseIterable {
        case blue, green, black, red, yellow, white
    }
}
