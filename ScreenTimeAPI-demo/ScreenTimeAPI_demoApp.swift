//
//  ScreenTimeAPI_demoApp.swift
//  ScreenTimeAPI-demo
//
//  Created by Ravi Seta on 27/02/24.
//

import SwiftUI
import ManagedSettings
import FamilyControls

@main
struct ScreenTimeAPI_demoApp: App {
    
    @StateObject var model = SettingsViewModel.shared
    @StateObject var store = ManagedSettingsStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(store)
                .onAppear {
                    Task {
                        do {
                            if #available(iOS 16.0, *) {
                                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
                            }
                        } catch {
                            print("Faild authorization error: \(error.localizedDescription)")
                        }
                    }
                }

        }
    }
}
