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

            if item.isInStock {
                Section {
                    Stepper("Quantity: \(item.quantity)", value: $item.quantity)
                    Button("Mark as sold out") {
                        item.quantity = 0
                        item.isInStock = false
                    }
                } header: {
                    Text("In stock")
                }
            } else {
                Section {
                    Toggle("Is on back order?", isOn: $item.isOnBackOrder)
                    Button("Is back in stock!") {
                        item.quantity = 1
                        item.isInStock = true
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
            ItemView(item: .constant(.init(name: "Item", color: .blue)))
                .previewDisplayName("In stock")
            ItemView(item: .constant(.init(name: "Item", color: .blue, isInStock: false, isOnBackOrder: true)))
                .previewDisplayName("In stock")
        }
    }
}
