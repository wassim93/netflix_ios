//
//  APICaller.swift
//  netflix_clone
//
//  Created by wassim on 9/8/2022.
//

import Foundation


class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion:@escaping(String)->Void){
        guard let url = URL(string: "\(APIConfig.BASE_URL)//trending/all/day?api_key=\(APIConfig.apiKey)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,error == nil else {
                return
            }
            do{let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
