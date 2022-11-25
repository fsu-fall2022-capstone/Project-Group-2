//
//  UserDataViewModel.swift
//  FitnessTracking
//
//  Created by Noah William Shaffer on 11/24/22.
//
/*
import Foundation
import Foundation
import Combine

enum UserDataState{
    case successful
    case failed(error: Error)
    case na
}

protocol UserDataViewModel {
    func UserData()
    var service: UserDataService {get}
    var state: UserDataState {get}
    var details: UserDataDetails {get}
    var hasError: Bool {get}
    init(service: UserDataService)
}
    
    var state: UserDataState
    
    var details: UserDataDetails
    
    var hasError: Bool
    
    let service: UserDataService
    
    init(service: UserDataService){
        self.service = service
        
        $state
            .map{ state -> Bool in
                switch state {
                case .successful, .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    func UserData(){
        service
            .UserData(with: details)
            .sink { res in
                
                switch res{
                case .failure(let error):
                    self.state = .failed(error: error)
                default: break
                }
                
            } receiveValue: {  [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
    }
}
*/
