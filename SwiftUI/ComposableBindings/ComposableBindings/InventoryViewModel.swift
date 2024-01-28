//
//  InventoryViewModel.swift
//  ComposableBindings
//
//  Created by Alonso on 27/01/24.
//

import Combine

class InventoryViewModel: ObservableObject {
    @Published var inventory: [Item]
    @Published var draft: Item?

    init(inventory: [Item]) {
        self.inventory = inventory
    }

    func addButtonTapped() {
        draft = Item(name: "", color: nil, status: .inStock(quantity: 1))
    }

    func cancelButtonTapped() {
        self.draft = nil
    }

    func saveButtonTapped() {
        if let item = self.draft {
            self.inventory.append(item)
        }
        self.draft = nil
    }
}
