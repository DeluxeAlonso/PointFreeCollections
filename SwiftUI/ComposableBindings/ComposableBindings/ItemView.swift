//
//  ItemView.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item

    var body: some View {
        Form {
            TextField("Name", text: $item.name)
            Picker(selection: $item.color) {
                Text("None")
                    .tag(Item.Color?.none)

                ForEach(Item.Color.allCases, id: \.rawValue) { color in
                    Text(color.rawValue)
                        .tag(Optional(color))
                }
            } label: {
                Text("Color")
            }

            if item.status.isInStock {
                Section {
                    Stepper("Quantity: \(item.status.quantity)", value: $item.status.quantity)
                    Button("Mark as sold out") {
                        item.status = .outOfStock(isOnBackOrder: false)
                    }
                } header: {
                    Text("In stock")
                }
            } else {
                Section {
                    Toggle("Is on back order?", isOn: $item.status.isOnBackOrder)
                    Button("Is back in stock!") {
                        item.status = .inStock(quantity: 1)
                    }
                } header: {
                    Text("Out of stock")
                }
            }
        }.navigationTitle("Add item")
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemView(item: .constant(.init(name: "Item", color: .blue, status: .inStock(quantity: 1))))
                .previewDisplayName("In stock")
            ItemView(item: .constant(.init(name: "Item", color: .blue, status: .outOfStock(isOnBackOrder: true))))
                .previewDisplayName("In stock")
        }
    }
}
