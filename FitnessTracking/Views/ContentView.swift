//  ContentView.swift
//  FitnessTracking
//
//  Matthew Kolnicki, Jalal Jean-Charles, Noah Shaffer, Randy Toyberman

import LocalAuthentication
import SwiftUI
//test

@available(iOS 16.0, *)
struct LandingView: View {
    @State private var unlocked = false
    @State private var newUser = false
    @State private var existingUser = false
    @State private var text = "LOCKED"
    @State private var username = ""
    @State private var password = ""
    @State private var signedIn = false;
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                Button("Log In") {
                    signedIn = true
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                Text("New User?")
                Button("Sign Up") {
                    newUser = true
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                
                NavigationLink(destination: Text("Welcome, " + username).navigationBarBackButtonHidden(false), isActive: $signedIn) {
                    EmptyView()
                }
                NavigationLink(destination: SignUpView(), isActive: $newUser) {
                    EmptyView()
                }
            }
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
                    text = "There was a problem, try again"
                    
                }
            }
        } else {
            text = "This phone does not have biometrics"
        }
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var signedIn = false;
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    Button("Log In") {
                        signedIn = true
                    }.padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Welcome, " + username).navigationBarBackButtonHidden(true), isActive: $signedIn) {
                        EmptyView()
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            LandingView()
        } else {
            // Fallback on earlier versions
        }
    }
}
