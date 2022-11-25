//
//  UserDataModel.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//
/*
import Foundation
import Combine
import FirebaseAuth

protocol UserDataService{
    func UserData(with details:  LoginDetails) -> AnyPublisher<Void,Error>
}

final class UserDataModelImpl: UserDataService {
    func UserData(with details:  LoginDetails) -> AnyPublisher<Void,Error> {
        Deferred{
            
           
            Future { promise in
                //Change to the database name here
                Auth.auth().signIn(withEmail: details.email,
                                       password: details.password) { result, error in
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
