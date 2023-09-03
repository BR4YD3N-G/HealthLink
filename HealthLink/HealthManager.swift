//
//  HealthManager.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import Foundation
import HealthKit

// Extension to get the start of the current day
extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

// Class responsible for managing health-related data
class HealthManager: ObservableObject {
    
    // Published property to store activities data
    @Published var activites: [String: Activity] = [:]
    
    // HealthKit store for interacting with health data
    let healthStore = HKHealthStore()
    
    // Task for requesting HealthKit authorization
    private var authorizationTask: Task<Void, Error>?

    // Initialize the HealthManager
    init() {
        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [steps]

        // Request HealthKit authorization for reading step count data
        authorizationTask = Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("Error fetching health data: \(error.localizedDescription)")
            }
        }
    }

    // Deinitializer to cancel any outstanding authorization tasks
    deinit {
        authorizationTask?.cancel()
    }
    
    // Fetch today's step count from HealthKit
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching today's step data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            
            // Create an Activity object and update activites dictionary on the main thread
            let activity = Activity(id: 0, title: "Steps Today", subtitle: "Goal: ", icon: "figure.walk", amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                self.activites["todaySteps"] = activity
            }
            
            print(stepCount)
        }
        
        healthStore.execute(query)
    }
}

// Extension to format a Double as a string with no decimal places
extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}
