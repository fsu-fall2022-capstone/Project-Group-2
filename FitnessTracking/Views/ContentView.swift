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
    
    func signin(email: String , password: String){
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async{
                self?.authorized = true
            }
        }
        
        
    }
    
    func signup(email: String , password: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async{
                self?.authorized = true
            }
        }
        
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
    @State private var signedIn = false;
    
    var body: some View {
        NavigationView {
            VStack {
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
                Button("Log In") {
                    authViewModel.signin(email: email, password: password)
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
                
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(false), isActive: $signedIn) {
                    EmptyView()
                }
                NavigationLink(destination: SignUpView(), isActive: $newUser) {
                    EmptyView()
                }
            }
        }
        .onAppear(){
            authViewModel.authorized = authViewModel.isSignedIn
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            LandingView()
    }
}
