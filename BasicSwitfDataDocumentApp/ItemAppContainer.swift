//
//  ItemAppContainer.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/12/23.
//

import SwiftData

@MainActor
var itemAppContainer: ModelContainer {
	do {
		let container = try ModelContainer(for: Settings.self)
		
		var itemFetchDescriptor = FetchDescriptor<Settings>()
		itemFetchDescriptor.fetchLimit = 1
		
		guard try container.mainContext.fetch(itemFetchDescriptor).count == 0 else { return container }

		let setting = Settings(globalInt: 3, globalString: "GLOBAL TEXT")
		
		container.mainContext.insert(setting)
		
		return container
	}
	catch {
		fatalError("Exception creating ModelContainer")
	}
}


