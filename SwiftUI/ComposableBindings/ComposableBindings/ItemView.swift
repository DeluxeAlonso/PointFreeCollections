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

        }.navigationTitle("Add item")
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            ItemView(item: .constant(.init(name: "Item", color: .blue)))
        }
    }
}
