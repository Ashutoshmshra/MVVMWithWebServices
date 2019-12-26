//
//  HomeDataViewModel.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation

class  HomeDataViewModel {
    private var networkManager = NetworkManager()
    private var repos: ResponseDataModel?
    private var repoDataItem: [Repo] = [Repo]()
    
    func getMostPopularResponse(language:String, completion: (()-> Void)?){
        networkManager.performNetworkTask(endpoint: APIData.repository(language: language), type: ResponseDataModel.self) { [weak self](response) in
            self?.repos = response
            self?.repoDataItem = (self?.repos!.items)!
            completion?()
        }
    }
    
    public var count: Int {
        return repos?.items.count ?? 0
    }
    public func selectedUserLogin(index: Int) -> String {
        return repos?.items[index].owner.login ?? ""
    }
    public var response: [Repo]{
        return repoDataItem
    }

}
