//
//  APIConfig.swift
//  netflix_clone
//
//  Created by wassim on 9/8/2022.
//

import Foundation

class APIConfig{
    static let BASE_URL = "https://api.themoviedb.org/3"
    static var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "TMDB", ofType: "plist") else {
          fatalError("Couldn't find file 'TMDB.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'TMDB.plist'.")
        }
        return value
      }
    }

}
