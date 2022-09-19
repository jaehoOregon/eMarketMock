//
//  listSection.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/19.
//

import Foundation

enum listSection {
    case popular([listItem])
    case used([listItem])
    case life([listItem])
    
    var items: [listItem] {
        switch self {
        case .popular(let items),
                .used(let items),
                .life(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .popular:
            return "인기취향/취미"
        case .used:
            return "중고거래"
        case .life:
            return "생활"
        }
    }
} 



//Collection Section: 인기취향/취미

////Collection Section: 중고거래
////Collection Section: 생활
//var sectionThreeImage: [String] = ["localservice", "rooms", "jobs", "talentshare"]
//var sectionThreeLabel: [String] = ["localservice", "rooms", "jobs", "talentshare"]
