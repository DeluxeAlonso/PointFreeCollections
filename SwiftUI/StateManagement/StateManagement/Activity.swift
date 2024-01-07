//
//  Activity.swift
//  StateManagement
//
//  Created by Alonso on 7/01/24.
//

import Foundation

struct Activity {
    let timestamp: Date
    let type: ActivityType

    init(timestamp: Date = Date(), type: ActivityType) {
        self.timestamp = timestamp
        self.type = type
    }
    
    enum ActivityType {
        case addedFavoritePrime(Int)
        case removedFavoritePrime(Int)
    }
}
