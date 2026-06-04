//
//  Item.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 04/06/2026.
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
