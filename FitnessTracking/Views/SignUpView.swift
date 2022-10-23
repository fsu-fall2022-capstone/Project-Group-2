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
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
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
        } else {
            // Fallback on earlier versions
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
