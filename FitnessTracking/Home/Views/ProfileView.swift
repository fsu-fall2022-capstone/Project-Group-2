//
//  ProfileView.swift
//  FitnessTracking
//
//  Created by Xander Jean on 11/11/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    var body: some View {
        List {
            Section("Fitness Information") {
                Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Gender: \(sessionService.userDetails?.gender ?? "N/A")")
                Text("Age: \(sessionService.userDetails?.age ?? "N/A")")
                Text("Height: \(sessionService.userDetails?.height ?? "N/A")in")
                Text("Weight: \(sessionService.userDetails?.weight ?? "N/A")lbs")
                Text("Weight")
                Text("Age")
            }
            Section("Goals"){
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
