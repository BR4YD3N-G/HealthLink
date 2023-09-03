//
//  HomeView.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ActivityCard(activity: Activity(id: 0, title: "Steps", subtitle: "Goal", icon: "figure.walk", amount: "100"))
                
                ActivityCard(activity: Activity(id: 1, title: "Glucose", subtitle: "", icon: "drop.degreesign", amount: "100ich"))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
