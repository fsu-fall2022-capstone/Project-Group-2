//
//  FitnessTrackingApp.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/10/22.
//

import SwiftUI

@main
struct FitnessTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                LandingView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
