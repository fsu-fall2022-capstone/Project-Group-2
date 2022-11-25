//
//  SessionService.swift
//  FitnessTracking
//
//  Created by Annie Chow on 11/5/22.
//

import Foundation
import Combine
import FirebaseAuth

enum SessionState{
    case loggedIn
    case loggedOut
}

protocol SessionService{
    var state: SessionState { get}
    //var userDetails: SessionUserDetails? { get}
    func logout()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    @Published var state: SessionState = .loggedOut
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] result, user in
                guard let self = self else { return}
                self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid{
                    self.handleRefresh(with: uid)
                }
            }
    }
    
    func logout(){
        try? Auth.auth().signOut()
    }
    
    func handleRefresh(with uid: String){
        //Function will grab uid properties stored with firebase and assign to userdetails
    }
}
