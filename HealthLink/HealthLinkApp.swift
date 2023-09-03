//
//  HealthLinkApp.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

@main
struct HealthLinkApp: App {
    @StateObject var manager = HealthManager()
    var body: some Scene {
        WindowGroup {
            HLTabView()
        }
    }
}
