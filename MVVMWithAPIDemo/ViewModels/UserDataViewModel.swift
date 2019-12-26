//
//  UserDataViewModel.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation
class UserDataViewModel {

    private let networking = NetworkManager()

    private var user: User?

    public func user(login: String, completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: APIData.user(login: login), type: User.self) { [weak self] (response) in
            self?.user = response
            completion?()
        }
    }

    public var imageURL: URL? {
        return URL(string: user?.avatar_url ?? "")
    }

    public var username: String {
        return user?.login ?? ""
    }

    public var name: String {
        return user?.name ?? ""
    }

    public var bio: String {
        return user?.bio ?? ""
    }

}
