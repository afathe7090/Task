//
//  NetworkModule.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation
import Combine


protocol NetworkManagerProtocol {
    func getResults<T: Codable>(_ model: T.Type , urlStr: String) -> Future<T, Error>
}



class NetworkManagerImplementaion: NetworkManagerProtocol {
    
    private var anyCancelable = Set<AnyCancellable>()
    
    
    func getResults<T: Codable>(_ model: T.Type , urlStr: String) -> Future<T, Error> {
        
        let url = URL(string: urlStr)!
        let decoder = JSONDecoder()
        
        return Future {[weak self] promise in
            guard let self = self else {return}
            URLSession.shared.dataTaskPublisher(for: url)
                .retry(1)
                .mapError {$0}
                .tryMap { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .decode(type: model.self , decoder: decoder)
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    
                } receiveValue: { data in
                    promise(.success(data))
                }
                .store(in: &self.anyCancelable)
        }
    }
    
  
}

