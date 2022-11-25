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
    
    @StateObject private var loginVM = LoginViewModelImpl(service: LoginServiceImpl())
    
    var body: some View{
        VStack{
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            InputTextView(text: $loginVM.details.email, holder: "Email",
                          keyboard: .emailAddress)
            
            InputPasswordView(password: $loginVM.details.password, holder: "Password")
            
            ButtonView(title: "Login"){
                loginVM.login()
            }
            
            ButtonView(title: "SignUp"){
                showSignUp.toggle()
            }
            .sheet(isPresented: $showSignUp
                   , content: {
                SignUpView()
            })
                
        }
        .alert(isPresented: $loginVM.hasError,
               content: {
            if case .failed(let error) = loginVM.state{
                return Alert(title: Text("Error"), message: Text(error.localizedDescription))
            }
            else{
                return Alert(title: Text("ERROR 505"), message: Text("unresolved issue on Login"))
            }
        })
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
