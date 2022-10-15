//
//  FetchJokeUseCases.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation

protocol FetchJokeUseCase {
    
    func execute<T>(objectType: T.Type, completion: @escaping (Joke) -> Void)
}


final class DefaultFetchJokeUseCases : FetchJokeUseCase {
    
    init() { }
   
    func execute<T>(objectType: T.Type, completion: @escaping (Joke) -> Void) {
        
        let parameter = "format=json"
        let endPoint = APIEndpoints.getJokesURL(with: parameter)

        NetworkService.shared.dataRequest(with: endPoint, objectType: Joke.self) { [weak self] (result: Result) in
            
            if self != nil {
                switch result {
                case .success(let object):
                    completion(object)
                case .failure(_):
                    print("Error in Fetching Data")
                }
            }
        }
    }
}
