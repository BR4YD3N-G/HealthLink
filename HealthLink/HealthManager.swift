//
//  HealthManager.swift
//  HealthLink
//
//  Created by Brayden Graham on 9/3/23.
//

import Foundation
import HealthKit

class HealthManager : ObservableObject {
    
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
    
}
