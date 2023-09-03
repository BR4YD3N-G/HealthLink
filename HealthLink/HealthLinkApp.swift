//
//  HealthLinkApp.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

// The main entry point of the app
@main
struct HealthLinkApp: App {
    // Create an instance of HealthManager using @StateObject
    @StateObject var manager = HealthManager()
    
    // Define the app's scene, which contains the root view
    var body: some Scene {
        WindowGroup {
            // Set the root view of the app to HLTabView
            HLTabView()
        }
    }
}
