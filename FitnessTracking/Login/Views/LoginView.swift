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

struct LoginView: View {

    @State private var showSignUp = false
    
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View{
        VStack{
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            InputTextView(text: $vm.details.email, holder: "Email",
                          keyboard: .emailAddress)
            
            InputPasswordView(password: $vm.details.password, holder: "Password")
            
            ButtonView(title: "Login"){
                vm.login()
            }
            
            ButtonView(title: "SignUp"){
                showSignUp.toggle()
            }
            .sheet(isPresented: $showSignUp
                   , content: {
                SignUpView()
            })
                
        }
    }
    
    /*func authenticate(){
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
    }*/
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView()
        }
    }
}
