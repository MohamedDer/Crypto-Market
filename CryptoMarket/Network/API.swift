//
//  API.swift
//  CryptoMarket
//
//  Created by Mohamed Derkaoui on 21/02/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
import PromiseKit



class API {
  
    static func getCryptoData() -> Promise<[Cryptocurrency]> {
        return Promise { fulfill, reject in
    
        var currencies = [Cryptocurrency]()
        let target = CoinMarketCapAPI.ticker(limit: 15)
        let provider = MoyaProvider<CoinMarketCapAPI>(plugins: target.plugins)

        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    for (_,element):(String, JSON) in json {
                        let currency = Cryptocurrency(JSONString: element.rawString()!)
                        currencies.append(currency!)
                    }
                    fulfill(currencies)
                }
                catch {
                    print("error in json file")
                    reject(error)
                }

            case let .failure(error):
                reject(error)

            }

        }

        }
    
    
    
    }
    
    
}














