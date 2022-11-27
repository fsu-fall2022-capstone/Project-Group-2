//
//  ProfileView.swift
//  FitnessTracking
//
//  Created by Xander Jean on 11/11/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section("Fitness Information") {
                Text("Height")
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
