//
//  HLTabView.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

struct HLTabView: View {
    @EnvironmentObject var manager: HealthManager
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("home")
                .tabItem {
                    Image(systemName: "house")
                }
                .environmentObject(manager)
            
            ContentView()
                .tag("Content")
                .tabItem {
                    Image(systemName: "person")
                }
            
            SettingsView()
                .tag("Settings")
                .tabItem {
                    Image(systemName: "gearshape")
                }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HLTabView_Previews: PreviewProvider {
    static var previews: some View {
        HLTabView()
    }
}
