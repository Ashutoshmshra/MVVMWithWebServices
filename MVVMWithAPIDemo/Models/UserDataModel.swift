//
//  UserDataModel.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation
struct User: Codable {
    let login: String
    let url: String
    let name: String?
    let avatar_url: String?
    let bio: String?
}
