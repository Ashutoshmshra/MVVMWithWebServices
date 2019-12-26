//
//  URLData.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation

protocol URLData {
    var baseURL: URL { get }
    var path: String { get }
}
