//
//  ContentView.swift
//  Navigation
//
//  Created by Alonso on 19/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            VStack {
                Text("One")
                Button("Go to 2nd tab") {
                    viewModel.selectedTab = .two
                }
            }
            .tabItem { Text("One") }
            .tag(Tab.one)
            Text("Two")
                .tabItem { Text("Two") }
                .tag(Tab.two)
            Text("Three")
                .tabItem { Text("Three") }
                .tag(Tab.three)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(selectedTab: .two))
    }
}
