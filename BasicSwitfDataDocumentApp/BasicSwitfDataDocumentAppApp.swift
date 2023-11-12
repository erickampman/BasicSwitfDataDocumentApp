//
//  BasicSwitfDataDocumentAppApp.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/11/23.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct BasicSwitfDataDocumentAppApp: App {
    var body: some Scene {
        DocumentGroup(editing: .itemDocument, migrationPlan: BasicSwitfDataDocumentAppMigrationPlan.self) {
            ContentView()
        }
    }
}

extension UTType {
    static var itemDocument: UTType {
        UTType(importedAs: "com.example.item-document")
    }
}

struct BasicSwitfDataDocumentAppMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        BasicSwitfDataDocumentAppVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct BasicSwitfDataDocumentAppVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [
        Item.self,
		Settings.self
    ]
}
