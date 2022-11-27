//
//  UserDataView.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//

import Foundation
import LocalAuthentication
import SwiftUI
import FirebaseAuth

class Auth0ViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var authorized = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
}

struct UserDataView: View {
    @State private var showSignUp = false
    @StateObject private var UserDataVM = UserDataViewModelImpl(service: UserDataServiceImpl())
    
    
    var body: some View{
        //State private var showSignUp = false
        
        
        VStack{
            Text("Tell us about yourself")
                .font(.largeTitle)
                .bold()
                .padding()
            InputTextView(text: $UserDataVM.details.gender, holder: "Gender: ", keyboard: .default)
            InputTextView(text: $UserDataVM.details.age, holder: "Age: ",keyboard: .default)
            InputTextView(text: $UserDataVM.details.height, holder: "Height: ",keyboard: .default)
            InputTextView(text: $UserDataVM.details.weight, holder: "Weight: ",keyboard: .default)
            InputTextView(text: $UserDataVM.details.activity, holder: "Activity Level: ",keyboard: .default)
            InputTextView(text: $UserDataVM.details.goal, holder: "Goal",keyboard: .default)
            
            ButtonView(title: "Submit"){
                UserDataVM.UserData()
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
}
    
    
    struct userDataView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                UserDataView()
            }
        }
    }


