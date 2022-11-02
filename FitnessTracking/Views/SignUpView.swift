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
    @Environment(\.presentationMode) var presentationMode
    
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
                VStack{
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
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
                    
                    Divider()
                    
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
                }
                Button("Sign Up") {
                    signup()
                }.padding()
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                NavigationLink(destination: LandingView(), isActive: $newUser) {
                    EmptyView()
                }
                
            }
            .toolbar{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
    }
    
    func signup(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
        
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
