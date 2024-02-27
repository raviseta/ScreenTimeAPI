//
//  ContentView.swift
//  ScreenTimeAPI-demo
//
//  Created by Ravi Seta on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRestrict = false
    @State private var isAllow = false
    
    @EnvironmentObject var viewModel: SettingsViewModel

    
    var body: some View {
        VStack(spacing: 16) {
            Button("Select Apps to Restrict") {
                isRestrict = true
            }
            .familyActivityPicker(isPresented: $isRestrict, selection: $viewModel.restrictSelected)
            
            Button("Select Apps to allow") {
                isAllow = true
            }
            .familyActivityPicker(isPresented: $isAllow, selection: $viewModel.allowedSelected)
            
        }
        .onChange(of: viewModel.restrictSelected) { newSelection in
            SettingsViewModel.shared.setShieldRestrictions()
        }
    }
}

#Preview {
    ContentView()
}
