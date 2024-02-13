//
//  InventoryView.swift
//  ComposableBindings
//
//  Created by Alonso on 27/01/24.
//

import SwiftUI

struct InventoryView: View {
  @ObservedObject var viewModel: InventoryViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.inventory, id: \.self) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)

                            if case let .inStock(quantity) = item.status {
                                Text("In stock: \(quantity)")
                            } else if case let .outOfStock(isOnBackOrder) = item.status {
                                Text("Out of stock" + (isOnBackOrder ? ": on back order" : ""))
                            }
                        }
                        
                        Spacer()
                        
                        item.color.map { color in
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(color.toSwiftUIColor)
                                .border(Color.black, width: 1)
                        }

                        Button(action: { self.viewModel.duplicate(item: item) }) {
                            Image(systemName: "doc.on.doc.fill")
                        }
                        .padding(.leading)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(item.status.isInStock ? nil : Color.gray)
                }
            }
            .navigationBarTitle("Inventory")
            .navigationBarItems(trailing: Button("Add") {
                self.viewModel.addButtonTapped()
            })
            .sheet(unwrap: self.$viewModel.draft) { item in
                NavigationView {
                    ItemView(item: item)
                        .navigationBarItems(
                            leading: Button("Cancel") { self.viewModel.cancelButtonTapped() },
                            trailing: Button("Save") { self.viewModel.saveButtonTapped() }
                        )
                }
            }
        }
    }
}

extension View {
    func sheet<Item, Content>(
        unwrap item: Binding<Item?>,
        @ViewBuilder content: @escaping (Binding<Item>) -> Content
    ) -> some View where Item: Identifiable, Content: View {
        self.sheet(item: item) { _ in
            item.unwrap().map(content)
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = InventoryViewModel(
            inventory: [
              Item(name: "Keyboard", color: .blue, status: .inStock(quantity: 100)),
              Item(name: "Charger", color: .yellow, status: .inStock(quantity: 20)),
              Item(name: "Phone", color: .green, status: .outOfStock(isOnBackOrder: true)),
              Item(name: "Headphones", color: .green, status: .outOfStock(isOnBackOrder: false)),
            ]
          )
        return InventoryView(viewModel: viewModel)
    }
}
