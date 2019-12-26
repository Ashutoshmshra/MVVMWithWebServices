//
//  ResponseDataModel.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation
struct  Response {
    fileprivate var data:Data
    init(data:Data) {
        self.data = data
    }
}
extension Response{

    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch _ {
            return nil
        }
    }

    
}

struct  ResponseDataModel: Codable {
    let total_count: Int
    let items: [Repo]
}

struct Repo: Codable {
    let name: String
    let description: String
    let owner: User
    let language: String
    let stargazers_count: Int
}


