//
//  APIData.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation
enum APIData{
    case repository(language:String)
    case user(login:String)
}
extension APIData:URLData{
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    var path: String {
        switch self {
        case .repository(let language):
            return "/search/repositories?q=+language:\(language)&sort=stars&order=desc"
        case .user(let login):
            return "users/\(login)"
            
        }
        
    }
}
