//
//  SignUpView.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 10/23/22.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    /*@StateObject private var vm = SignUpViewModelImpl(
        service: SignUpImpl()
    )*/
    @State private var email = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        
        NavigationView{
            
            VStack{
                
                VStack{
                    Text("SignUp")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    InputTextView(text: $email, holder: "Email",
                                  keyboard: .emailAddress)
                    
                    InputPasswordView(password: $password, holder: "Password")
                    
                    Divider()
                    
                    InputTextView(text: .constant(""), holder: "First Name",
                                  keyboard: .emailAddress)
                    InputTextView(text: .constant(""), holder: "Last Name",
                                  keyboard: .emailAddress)
                    
                    
                }
                
                ButtonView(title: "SignUp"){
                    signup()
                }
            }
            .padding()
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
        Auth.auth().createUser(withEmail: email, password: password) { result , error in
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
