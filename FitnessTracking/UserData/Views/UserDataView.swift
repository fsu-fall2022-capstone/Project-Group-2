//
//  UserDataView.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//

import SwiftUI
import FirebaseAuth

struct UserDataView: View {
    
    @StateObject private var UserDataVM = UserDataViewModelImpl(service: UserDataImpl())
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                VStack{
                    Text("Tell us about youself...")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    InputTextView(text: $UserDataVM.details.gender, holder: "Gender",
                                  keyboard: .default)
                    
                    InputTextView(text: $UserDataVM.details.height, holder: "Height in inches", keyboard: .default)
                    
                    Divider()
                    
                    InputTextView(text: $UserDataVM.details.weight, holder: "weight in lbs", keyboard: .default)
                    
                    InputTextView(text: $UserDataVM.details.activity, holder: "activity", keyboard: .default)
                    
                    InputTextView(text: $UserDataVM.details.goal, holder: "Goal", keyboard: .default)
                    
                    
                }
                
                ButtonView(title: "Enter"){
                    UserDataVM.UserData()
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
            .alert(isPresented: $UserDataVM.hasError,
                   content: {
                if case .failed(let error) = UserDataVM.state{
                    return Alert(title: Text("Error"), message: Text(error.localizedDescription))
                }
                else{
                    return Alert(title: Text("ERROR 505"), message: Text("unresolved issue on Sign Up"))
                }
            })

        }
    }
    
}

struct UserDataView_Previews: PreviewProvider {
    static var previews: some View {
        UserDataView()
    }
}
