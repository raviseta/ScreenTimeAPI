//
//  Schedule.swift
//  ScreenTimeAPI-demo
//
//  Created by Ravi Seta on 27/02/24.
//

import Foundation
import DeviceActivity

extension DeviceActivityName {
    // Set the name of the activity to "daily"
    static let daily = Self("daily")
}

extension DeviceActivityEvent.Name {
    static let allowed = Self("allowed")
}

let schedule = DeviceActivitySchedule(
    intervalStart: DateComponents(hour: 0, minute: 0),
    intervalEnd: DateComponents(hour: 23, minute: 59),
    repeats: true
)

class MySchedule {
    static public func setSchedule() {
        print("Hour is: ", Calendar.current.dateComponents([.hour, .minute], from: Date()).hour!)

        let events: [DeviceActivityEvent.Name: DeviceActivityEvent] = [
            .allowed: DeviceActivityEvent(
                applications: SettingsViewModel.shared.allowedSelected.applicationTokens,
                threshold: DateComponents(minute: 60)
            )
        ]
        
        // Create a Device Activity center
        let center = DeviceActivityCenter()
        do {
            print("Try to start monitoring...")
            // Call startMonitoring with the activity name, schedule, and events
            try center.startMonitoring(.daily, during: schedule, events: events)
        } catch {
            print("Error monitoring schedule: ", error)
        }
    }
}
