//
//  InventoryViewModel.swift
//  ComposableBindings
//
//  Created by Alonso on 27/01/24.
//

import Combine
import Foundation

class InventoryViewModel: ObservableObject {
    @Published var inventory: [Item]
    @Published var draft: Item?
    // @Published var draft: Draft?

    init(inventory: [Item]) {
        self.inventory = inventory
    }

    func addButtonTapped() {
        draft = Item(name: "", color: nil, status: .inStock(quantity: 1))
        // draft = .adding(Item(name: "", color: nil, status: .inStock(quantity: 1)))
    }

    func cancelButtonTapped() {
        self.draft = nil
    }

    func saveButtonTapped() {
        if let item = self.draft {
            self.inventory.append(item)
        }
        self.draft = nil

//        switch self.draft {
//        case let .some(.duplicating(item)),
//            let .some(.adding(item)):
//            self.inventory.append(item)
//
//        case .none:
//            break
//        }
//        self.draft = nil
    }

    func duplicate(item: Item) {
        self.draft = Item(name: item.name, color: item.color, status: item.status)
        // self.draft = .duplicating(Item(name: item.name, color: item.color, status: item.status))
    }
}

enum Draft: Identifiable, Hashable {
    case adding(Item)
    case duplicating(Item)

    var id: UUID {
        switch self {
        case let .adding(item): return item.id
        case let .duplicating(item): return item.id
        }
    }
}
