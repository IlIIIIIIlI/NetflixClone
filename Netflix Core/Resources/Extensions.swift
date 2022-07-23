//
//  Extensions.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/24.
//

import Foundation

/**
 可以自定义一个对于string类型的格式转换规则
 */

extension String {
    func capitalizFirst() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
