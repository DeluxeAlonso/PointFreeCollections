//
//  ItemView.swift
//  ComposableBindings
//
//  Created by Alonso on 10/01/24.
//

import CasePaths
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

            self.$item.status[/Item.Status.inStock].map { quantity in
                Section {
                    Stepper("Quantity: \(quantity.wrappedValue)", value: quantity, in: 1...Int.max)
                    Button("Mark as sold out") {
                        item.status = .outOfStock(isOnBackOrder: false)
                    }
                } header: {
                    Text("In stock")
                }
            }
            self.$item.status[/Item.Status.outOfStock].map { isOnBackOrder in
                Section {
                    Toggle("Is on back order?", isOn: isOnBackOrder)
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
                .previewDisplayName("Out of stock")
        }
    }
}
