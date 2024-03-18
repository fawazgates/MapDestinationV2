//
//  Item.swift
//  MapDestinationV2
//
//  Created by User on 18/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
