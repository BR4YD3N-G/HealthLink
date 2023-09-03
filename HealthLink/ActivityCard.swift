//
//  HealthCard.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subtitle: String
    let icon: String
    let amount: String
}

struct ActivityCard: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing:20){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.title)
                            .font(.system(size: 16))
                        
                        Text(activity.subtitle)
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.icon)
                        .foregroundColor(.green)
                }
                
                
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
        ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subtitle: "Goal: 100", icon: "figure.walk", amount: "10,00"))
    }
}
