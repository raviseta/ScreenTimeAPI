//
//  SettingsViewModel.swift
//  ScreenTimeAPI-demo
//
//  Created by Ravi Seta on 27/02/24.
//

import Foundation
import FamilyControls
import ManagedSettings
import ScreenTime

private let _SettingsViewModel = SettingsViewModel()

class SettingsViewModel: ObservableObject {
    // Import ManagedSettings to get access to the application shield restriction
    let store = ManagedSettingsStore()
    
    @Published var restrictSelected: FamilyActivitySelection
    @Published var allowedSelected: FamilyActivitySelection
    
    init() {
        restrictSelected = FamilyActivitySelection()
        allowedSelected = FamilyActivitySelection()
    }
    
    class var shared: SettingsViewModel {
        return _SettingsViewModel
    }
    
    func setShieldRestrictions() {
        // Pull the selection out of the app's model and configure the application shield restriction accordingly
        let applications = SettingsViewModel.shared.restrictSelected
        
        store.shield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = applications.categoryTokens.isEmpty
        ? nil
        : ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
    
    func calculateTotalUsageTime() {

    }
}
