//
//  NetworkService.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation

enum NetworkError: Error {
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(NetworkError)
}

public final class NetworkService{
    
    static let shared = NetworkService()
    private init(){}
    
    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        //create the url with NSURL
        let dataURL = URL(string: url)!
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard let data = data else {
                return
            }
            do {
                //create decodable object from data
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(NetworkError.jsonParsingError(error as! DecodingError)))
            }
        })
        task.resume()
    }
}
