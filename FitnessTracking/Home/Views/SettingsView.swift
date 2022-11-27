//
//  SettingsView.swift
//  FitnessTracking
//
//  Created by Xander Jean on 11/11/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section("Account Information"){
                Text("Name:")
                Text("Email:")
            }
            Section("App Settings"){
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
