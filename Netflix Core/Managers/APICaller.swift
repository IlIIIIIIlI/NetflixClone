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
    // 返回result时候，要么movie， 要么error
    func getTrendingMovies(completion: @escaping (Result<[MovieInterface], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
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
                completion(.success(results.results))
            } catch {
//                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
            
            task.resume()
    }
    
    // for tvs
    func getTrendingTvs(completion: @escaping (Result<[TvInterface], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        // we get the data! from the link
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTVResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(error.localizedDescription)
            }
        }
            
            task.resume()
    }
    
    
    func getStockAPI(completion: @escaping (Result<[StockInterface], Error>) -> Void) {
        let stockAPIUrl = String(format: "http://api.tushare.pro")
            guard let serviceUrl = URL(string: stockAPIUrl) else { return }
            let parameters: [String: Any] = [
    
                "api_name": "stock_basic",
                "token": "25dbbe173567b0dc611ad5278f902aa6c7267b5db1941d767072ccfa",
                "params": ["list_status": "L"],
                "fields": ""
                
            ]
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                return
            }
            request.httpBody = httpBody
            request.timeoutInterval = 20
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
//                if let response = response {
//                    print(response)
//                }
                if let data = data {
                    do {
//                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        let results = try JSONDecoder().decode(StockAPIResponse.self, from: data)
                        print(results)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    

