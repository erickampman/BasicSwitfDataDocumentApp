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
	@Attribute(.unique) var id: Int
    var timestamp: Date
	var text: String

	init(id: Int, timestamp: Date, text: String) {
		self.id = id
        self.timestamp = timestamp
		self.text = text
    }
}

@Model
final class Settings {
	@Attribute(.unique) var id = Int(0)
	var globalInt: Int
	var globalString: String
	
	init(globalInt: Int, globalString: String) {
		self.globalInt = globalInt
		self.globalString = globalString
	}
}
