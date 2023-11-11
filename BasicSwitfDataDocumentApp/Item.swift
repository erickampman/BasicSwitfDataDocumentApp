//
//  Item.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/11/23.
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
