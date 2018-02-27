//
//  CoinMarketCapAPI.swift
//  CryptoMarket
//
//  Created by Mohamed Derkaoui on 21/02/2018.
//  Copyright © 2018 Mohamed Derkaoui. All rights reserved.
//

import Foundation
import Moya


enum CoinMarketCapAPI {
    case ticker(limit: Int)
}

extension CoinMarketCapAPI: TargetType{

    var baseURL: URL {
        let url = URL(string: "https://api.coinmarketcap.com/v1/")
        return url!
    }
    
    var path: String {
        switch self {
        case .ticker(_):
            return "ticker/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .ticker :
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .ticker :
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .ticker(let limit):
            return ["limit": limit]
//        default: ["limit": 10]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .ticker: return URLEncoding.queryString
//        default: return URLEncoding.default
        }
    }
    
    
}

extension CoinMarketCapAPI {
    var plugins: [PluginType] {
        return [NetworkLoggerPlugin()]
    }
}







