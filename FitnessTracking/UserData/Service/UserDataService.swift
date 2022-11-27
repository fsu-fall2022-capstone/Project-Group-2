//
//  UserDataService.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/25/22.
//


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

