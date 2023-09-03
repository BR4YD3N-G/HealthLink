//
//  HLTabView.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

// A SwiftUI view responsible for managing tab navigation
struct HLTabView: View {
    // Access the HealthManager as an environment object
    @EnvironmentObject var manager: HealthManager
    
    // State property to track the selected tab
    @State var selectedTab = "Home"
    
    var body: some View {
        // Create a TabView for navigation
        TabView(selection: $selectedTab) {
            // Home tab with the HomeView
            HomeView()
                .environmentObject(manager) // Pass the HealthManager as an environment object
                .tag("Home") // Set a tag to identify the tab
                .tabItem {
                    Image(systemName: "house") // Tab icon
                }
            
            // Content tab with the ContentView
            ContentView()
                .tag("Content") // Set a tag
                .tabItem {
                    Image(systemName: "person") // Tab icon
                }
            
            // Settings tab with the SettingsView
            SettingsView()
                .tag("Settings") // Set a tag
                .tabItem {
                    Image(systemName: "gearshape") // Tab icon
                }
        }
    }
}

// PreviewProvider for HLTabView
struct HLTabView_Previews: PreviewProvider {
    static var previews: some View {
        HLTabView()
    }
}
