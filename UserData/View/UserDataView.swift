//
//  UserDataView.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//
/*
import Foundation
import LocalAuthentication
import SwiftUI
import FirebaseAuth

struct UserDataView: View {
    
    
    @StateObject private var UserDataVM = UserDataModelImpl(service: UserDataServiceImpl())
    
    var body: some View{
        VStack{
            Text("Tell us about yourself")
                .font(.largeTitle)
                .bold()
                .padding()
            InputTextView(text: $UserDataVM.details.gender, holder: "Gender: ",keyboard: .emailAddress)
            InputTextView(text: $UserDataVM.details.age, holder: "Age: ",keyboard: .emailAddress)
            InputTextView(text: $UserDataVM.details.height, holder: "Height: ",keyboard: .emailAddress)
            InputTextView(text: $UserDataVM.details.weight, holder: "Weight: ",keyboard: .emailAddress)
            InputTextView(text: $UserDataVM.details.activity, holder: "Activity Level: ",keyboard: .emailAddress)
            InputTextView(text: $UserDataVM.details.goal, holder: "Goal",keyboard: .emailAddress)
            
            InputPasswordView(password: $UserDataVM.details.password, holder: "Password")
            
            ButtonView(title: "Login"){
                UserDataVM.login()
            }
            
        }
        .alert(isPresented: $UserDataVM.hasError,
               content: {
            if case .failed(let error) = UserDataVM.state{
                return Alert(title: Text("Error"), message: Text(error.localizedDescription))
            }
            else{
                return Alert(title: Text("ERROR 505"), message: Text("unresolved issue on Login"))
            }
        })
    }
    
    
    struct userDataView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                UserDataView()
            }
        }
    }
}
*/
