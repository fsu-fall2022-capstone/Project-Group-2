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
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
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
                    TextField("Enter Last Name", text: $lastName)
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
                        newUser = true;
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
                        .bold(true)
                    NavigationLink(destination: LandingView(), isActive: $currentUser) {
                        EmptyView()
                    }
                }
                HStack{
                    NavigationLink(destination: HomeView(), isActive: $newUser) {
                        EmptyView()
                    }
                }
            }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
