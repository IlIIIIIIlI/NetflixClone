//
//  APICaller.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/23.
//

import Foundation


// Give the constant, e.g. api index
struct Constants {
    static let API_KEY = "1d4f083cd2300aa8fb67922a5ffa352a"
    // 那个api获取的网址的前缀也是固定的
    static let baseURL = "https://api.themoviedb.org/"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    // 这后面的是可以变化的url
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        // we get the data! from the link
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // after we get the data, we store this in json format
            do {
                // 此行代码用于打印出我们从api上获得的数据
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
            
            task.resume()
            
            
        
    }
}
