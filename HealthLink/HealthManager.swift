//
//  HealthManager.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthManager : ObservableObject {
    
    @Published var activites: [String: Activity] = [:]
    
    let healthStore = HKHealthStore()
    
    init() {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        //let healthSyncTypes = []
        
        Task {
            do {
                try await healthStore .requestAuthorization(toShare: [] /*healthSyncTypes*/ , read: healthTypes)
            } catch {
                print("Error fetching health data")
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error Fetching todays step data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, title: "Steps Today", subtitle: "Goal: ", icon: "figure.walk", amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                self.activites["todaySteps"] = activity
            }
            
            print(stepCount)
        }
        
        healthStore.execute(query)
    }
}

extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
