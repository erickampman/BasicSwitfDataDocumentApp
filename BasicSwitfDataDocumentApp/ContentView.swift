//
//  ContentView.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
	@Query private var settings: [Settings]
    var body: some View {
		VStack {
			NavigationStack {
				List {
					ForEach(items) { item in
						NavigationLink(value: item) {
							VStack {
								Text(item.text)
									.font(.headline)
								Text(item.timestamp.formatted(date: .long, time: .shortened))
							}
						}
					}
				}
				.onAppear {
					addSettings()
				}
				.navigationDestination(for: Item.self, destination: ItemView.init)
				.toolbar {
					Button("Add", action: addItem)
				}
				List {
					ForEach(settings) { setting in
						NavigationLink(value: setting) {
							VStack {
								Text(setting.globalString)
									.font(.headline)
								Text(setting.globalInt.formatted(.number))
							}
						}

					}
				}
				.navigationDestination(for: Settings.self, destination: SettingView.init)

				Text("Outside List")
			}
		}
		
    }
	
	private func addSettings() {
		let pred = #Predicate<Settings> { _ in
			true
		}
		do {
			let curCount = try modelContext.fetchCount(FetchDescriptor(predicate: pred))
			if 0 != curCount { return }
			let settings = Settings(globalInt: 2010, globalString: "STRING IEEE")
			modelContext.insert(settings)
		}
		catch {
			fatalError("Exception creating settings")
		}

	}

    private func addItem() {
        withAnimation {
			let id = items.count + 1  // not sufficient of course
			let text = String("Item \(items.count+1)")
			let newItem = Item(id: id, timestamp: Date(), text: text)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
