//
//  SignUpService.swift
//  FitnessTracking
//
//  Created by Annie Chow on 11/3/22.
//

import Foundation
import Combine
import FirebaseDatabase
import Firebase

protocol SignUpService {
    func signup(with details: SignUpDetails) -> AnyPublisher<Void, Error>
}

final class SignUpImpl: SignUpService{
    
    func signup(with details: SignUpDetails) -> AnyPublisher<Void, Error>{
        Deferred{
            
            Future { promise in
                Auth.auth().createUser(withEmail: details.email,
                                       password: details.password) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        
                        if let uid = result?.user.uid{
                            
                            var firstName = ""
                            var lastName = ""
                            
                            let values = [firstName: details.firstName,
                                           lastName: details.lastName] as [String : Any]
                            
                            Database.database()
                                .reference()
                                .child("users")
                                .child(uid)
                                .updateChildValues(values)  { error, ref in
                                    
                                    if let err = error {
                                        print(error!.localizedDescription)
                                        promise(.failure(err))
                                    }
                                    else {
                                        promise(.success(()))
                                    }
                                }
                            
                        }
                        else{
                            promise(.failure(NSError(domain: "Invalid", code: 0)))
                        }
                        
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
