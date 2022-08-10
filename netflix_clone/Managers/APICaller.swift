//
//  APICaller.swift
//  netflix_clone
//
//  Created by wassim on 9/8/2022.
//

import Foundation


class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion:@escaping(Result<[Movie],Error>)->Void){
        guard let url = URL(string: "\(APIConfig.BASE_URL)/trending/all/day?api_key=\(APIConfig.apiKey)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,error == nil else {
                return
            }
            do{let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(error))

                
            }
        }
        task.resume()
    }
    
}
