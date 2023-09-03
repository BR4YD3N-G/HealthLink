//
//  HomeView.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

// View responsible for displaying health-related activities
struct HomeView: View {
    // Access the HealthManager as an environment object
    @EnvironmentObject var manager: HealthManager
    
    var body: some View {
        VStack {
            // Display activities in a grid
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                ForEach(manager.activites.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in
                    ActivityCard(activity: item.value)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            // Fetch today's step count when the view appears
            manager.fetchTodaySteps()
        }
    }
}

// PreviewProvider for HomeView
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
