//
//  UserDataService.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/25/22.
//


import Foundation
import Combine
import FirebaseDatabase
import Firebase

enum UserKeys: String{
    case firstName
    case lastName
}

protocol UserDataService {
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>
}

final class UserDataImpl: UserDataService{
    
    func UserData(with details: UserDataDetails) -> AnyPublisher<Void, Error>{
        Deferred{
            
            Future { promise in
                Auth.auth().createUser(withEmail: details.gender,
                                       password: details.height) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        
                        if let uid = result?.user.uid{
                            
                            let values = [dbKeys.firstName.rawValue: details.weight,
                                          dbKeys.lastName.rawValue: details.age] as [String : Any]
                            
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


/*

import Foundation
import Combine
import FirebaseAuth

protocol UserDataService{
    func UserData(with details:  UserDataDetails) -> AnyPublisher<Void,Error>
}
final class UserDataServiceImpl: UserDataService {
    func UserData(with details:  UserDataDetails) -> AnyPublisher<Void,Error> {
        Deferred{
            
           
            Future { promise in
                //Change to the database name here
                Auth.auth().signIn(withEmail: details.gender,
                                       password: details.goal) { result, error in
                    if let err = error {
                        print(error!.localizedDescription)
                        promise(.failure(err))
                    }
                    else{
                        promise(.success(()))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}

*/

