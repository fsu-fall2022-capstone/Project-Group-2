//
//  SignUpService.swift
//  FitnessTracking
//
//  Created by Jalal Jean-Charles on 11/3/22.
//

import Foundation
import Combine
import FirebaseDatabase
import Firebase

enum dbKeys: String{
    case firstName
    case lastName
}

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
                            
                            let values = [dbKeys.firstName.rawValue: details.firstName,
                                          dbKeys.lastName.rawValue: details.lastName] as [String : Any]
                            
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
