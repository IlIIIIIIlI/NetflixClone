//
//  TV.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/24.
//

import Foundation


struct TrendingTVResponse: Codable {
    let results: [TvInterface]
}

struct TvInterface: Codable  {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double
    let release_date: String?
    let title: String?
    let vote_average: Double
    let vote_count: Int
    
}
