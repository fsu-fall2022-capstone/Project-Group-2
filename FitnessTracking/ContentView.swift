//  ContentView.swift
//  FitnessTracking
//
//  Matthew Kolnicki, Jalal Jean-Charles, Noah Shaffer, Randy Toyberman
//
import LocalAuthentication
import SwiftUI


struct LandingView: View {
    @State private var unlocked = false
    @State private var newUser = false
    @State private var existingUser = false
    @State private var text = "LOCKED"
    
    var body: some View {
        /*VStack {
            Text(text)
                .padding()
            Button("Authenticate"){
                authenticate()
            }
        }*/
        NavigationView {
            VStack {
                Text("New User?")
                Button("Sign Up") {
                    newUser = true
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                Text("Already have an account?")
                    .padding(.top, 25.0)
                Button("Log In") {
                    existingUser = true
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                
                NavigationLink(destination: LoginView(), isActive: $existingUser) {
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
                    text = "There was a problem"
                    
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
        NavigationView {
            VStack {
                Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
                TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .cornerRadius(10)
                SecureField("Passname", text: $password)
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
                
                NavigationLink(destination: Text("Welcome, " + username).navigationBarBackButtonHidden(), isActive: $signedIn) {
                    EmptyView()
                }
            }
        }
    }
}

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirm = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                .font(.largeTitle)
                .bold()
                .padding()
                TextField("Enter username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .cornerRadius(10)
                SecureField("Enter password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .cornerRadius(10)
                SecureField("Confirm password", text: $confirm)
                .padding()
                .frame(width: 300, height: 50)
                .cornerRadius(10)
                Button("Sign Up") {
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
        
    }
}
