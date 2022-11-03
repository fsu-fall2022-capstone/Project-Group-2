//  ContentView.swift
//  FitnessTracking
//
//  Matthew Kolnicki, Jalal Jean-Charles, Noah Shaffer, Randy Toyberman

import LocalAuthentication
import SwiftUI
import FirebaseAuth
//test

class AuthViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var authorized = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
}

struct LandingView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var unlocked = false
    @State private var newUser = false
    @State private var existingUser = false
    @State private var text = "LOCKED"
    @State private var email = ""
    @State private var password = ""
    @State private var showSignUp = false;
    @State private var authorized = false;
    
    var body: some View{
            VStack {
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                
                VStack{
                    Button("Log In") {
                        signin()
                        //signedIn = true
                    }.padding()
                        
                    
                    Button("Sign Up") {
                        showSignUp.toggle()
                    }.padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                        
                        .sheet(isPresented: $showSignUp, content: {SignUpView()
                            
                        })
                }
                NavigationLink(destination: SignUpView(), isActive: $newUser) {
                    EmptyView()
                }
            }
    }
    
    func signin(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil{
                print(error!.localizedDescription)
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


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LView()
        }
    }
}
