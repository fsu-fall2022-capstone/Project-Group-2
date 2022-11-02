//
//  FitnessTrackingApp.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/10/22.
//

import SwiftUI
import Firebase

@main
struct FitnessTrackingApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //let authViewModel = AuthViewModel()
            
            if #available(iOS 16.0, *) {
                LandingView()
                    //.environmentObject(authViewModel)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

/*class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}*/
