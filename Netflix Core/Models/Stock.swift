//
//  Stock.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/24.
//

import Foundation

// 加上codable, 方便其他的调用
struct StockAPIResponse: Codable {
    let data: StockInterface
}

struct StockInterface: Codable {
    var fields: [String?]
    var items: StockItem
    struct StockItem: Codable {
    }
}
