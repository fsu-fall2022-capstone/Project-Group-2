//  ContentView.swift
//  FitnessTracking
//
//  Matthew Kolnicki, Jalal Jean-Charles, Noah Shaffer, Randy Toyberman
//
import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var unlocked = false
    @State private var text = "LOCKED"
    var body: some View {
        Text(text)
            .padding()
        Button("Authenticate"){
            authenticate()
        }
    }
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "This is for security"){ success, authenticationError in
                if success{
                    text = "UNLOCKED"
                } else {
                    text = "There was a problem"
                    
                }
            }
        } else {
            text = "This phone does not have biometrics"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
