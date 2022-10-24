//
//  SignUpView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/23/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirm = ""
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    
    
    var body: some View {
            NavigationView {
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Enter First Name", text: $firstname)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    TextField("Enter Last Name", text: $lastname)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    TextField("Enter Email", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    SecureField("Enter Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    SecureField("Confirm Password", text: $confirm)
                        .padding()
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    Button("Sign Up") {
                    }.padding()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                    Text("Already a user? LOGIN")
                }
            }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
