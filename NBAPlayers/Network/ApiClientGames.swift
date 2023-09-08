//
//  ApiClientGames.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 09.09.2023.
//

import Foundation

protocol ApiClientGames {
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void)
}
class ApiClientImplementation: ApiClientGames {
    func getGames(completion: @escaping (Result<[Game], Error>) -> Void) {
        let session = URLSession.shared
        
        let url = URL(string: "https://www.balldontlie.io/api/v1/games")!
        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest, completionHandler: {data, response, error in
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(GamesResponse.self, from: data)
                completion(.success(response.data))
            } catch(let error) {
                completion(.failure(error))
            }
        })
        dataTask.resume()
    }
}
