//
//  Cryptocurrency.swift
//  CryptoMarket
//
//  Created by Mohamed Derkaoui on 21/02/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import ObjectMapper


class Cryptocurrency: Mappable, Decodable {

    
    var id: String?
    var name: String?
    var symbol: String?
    var rank: String?
    var princeusd: String?
    var pricebtc: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        symbol <- map["symbol"]
        rank <- map["rank"]
        princeusd <- map["price_usd"]
        pricebtc <- map["price_btc"]
    }

}
