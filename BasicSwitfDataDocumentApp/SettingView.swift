//
//  SettingView.swift
//  BasicSwitfDataDocumentApp
//
//  Created by Eric Kampman on 11/12/23.
//

import SwiftUI

struct SettingView: View {
	@Environment(\.modelContext) private var modelContext
	@Bindable var setting: Settings
    var body: some View {
		VStack {
			TextField("Global String", text: $setting.globalString)
			TextField("Global Integer", value: $setting.globalInt, formatter: NumberFormatter())
		}
    }
}

//#Preview {
//    SettingView()
//}
