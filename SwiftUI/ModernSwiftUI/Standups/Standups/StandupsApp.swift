//
//  StandupsApp.swift
//  Standups
//
//  Created by Alonso on 16/10/24.
//

import SwiftUI

@main
struct StandupsApp: App {
    var body: some Scene {
        WindowGroup {
            StandupsList(model: StandupsListModel())
        }
    }
}
