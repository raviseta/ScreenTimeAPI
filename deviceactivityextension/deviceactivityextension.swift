//
//  deviceactivityextension.swift
//  deviceactivityextension
//
//  Created by Ravi Seta on 27/02/24.
//

import DeviceActivity
import SwiftUI

@main
struct deviceactivityextension: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
