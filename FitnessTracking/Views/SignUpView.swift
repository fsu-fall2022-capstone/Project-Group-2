//
//  SignUpView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/23/22.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirm = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var newUser = false
    @State private var currentUser = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Enter First Name", text: $firstName)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Enter Last Name", text: $lastName)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                TextField("Enter Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Enter Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                /*SecureField("Confirm Password", text: $confirm)
                 .padding()
                 .frame(width: 300, height: 50)
                 .cornerRadius(10)*/
                Button("Sign Up") {
                    authViewModel.signup(email: email, password: password)
                    
                    newUser = true
                    if authViewModel.authorized{
                        newUser = true
                    }
                    else{
                        return
                    }
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                Text("Already a user?")
                Button("LOGIN") {
                    currentUser = true
                }.padding()
                    .foregroundColor(.black)
                    .background(.white)
                //.bold(true)
                //Login/SignUp Button Linker Creates
                //Uninteded Back Button
                
                NavigationLink(destination: LandingView(), isActive: $newUser) {
                    EmptyView()
                }
                
            }
            /*HStack{
             
             }*/
        }
        .onAppear(){
            authViewModel.authorized = authViewModel.isSignedIn
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
