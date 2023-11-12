//
//  ItemView.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/11/23.
//

import SwiftUI
import SwiftData

struct ItemView: View {
	@Environment(\.modelContext) private var modelContext
	@Bindable var item: Item
//	@Query private var curItem: Item

    var body: some View {
		Form {
			TextField("Text", text: $item.text)
			DatePicker("Date", selection: $item.timestamp)
		}
		.navigationTitle("Edit Item")
		.navigationBarTitleDisplayMode(.inline)
    }
	
//	var item: Item {
//		let pred = #Predicate<Item> {
//			$0.id == 0
//		}
//		let item = modelContext.fetch(FetchDescriptor<PersistentModel>)
//			
//		}
//		return Item(timestamp: <#T##Date#>, text: <#T##String#>)
//	}
}

//#Preview {
//	ItemView(item:)
//}
