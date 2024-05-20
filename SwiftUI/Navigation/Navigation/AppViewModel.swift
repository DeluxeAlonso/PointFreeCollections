//
//  AppViewModel.swift
//  Navigation
//
//  Created by Alonso on 19/05/24.
//

import Combine

class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab

    init(selectedTab: Tab = .one) {
        self.selectedTab = selectedTab
    }
}
