//
//  HealthCard.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

// Struct representing an activity card's data
struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let icon: String
    let amount: String
}

// View for displaying an activity card
struct ActivityCard: View {
    // State property to hold the activity data
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            // Background color with rounded corners
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    // Activity title and subtitle
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer() // Spacer to push content to the right
                    
                    // Activity icon
                    Image(systemName: activity.icon)
                        .foregroundColor(.green)
                }
                
                // Activity amount (e.g., step count)
                Text(activity.amount)
                    .font(.system(size: 24))
            }
            .padding()
            .cornerRadius(15)
        }
        .padding()
    }
}

struct HealthCard_Previews: PreviewProvider {
    static var previews: some View {
        // Preview of the ActivityCard with sample data
        ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subtitle: "Goal: 100", icon: "figure.walk", amount: "10,000"))
    }
}
