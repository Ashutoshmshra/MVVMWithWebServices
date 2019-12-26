//
//  HomeViewController.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeTableView: UITableView!
    private var viewModel =  HomeDataViewModel()
    private var responseData: [Repo]?
    public let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActivityIndicator()
        loadViewModelData()
        
    }
    
    public func addActivityIndicator() {
        activityIndicator.center =  CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.darkGray
        self.view.addSubview(activityIndicator)
        
    }
    /// Load View model data
    fileprivate func loadViewModelData() {
        self.navigationItem.title = "Home"
        activityIndicator.startAnimating()
        viewModel.getMostPopularResponse(language: "Swift") { [weak self] in
            DispatchQueue.main.async {
                self?.homeTableView.reloadData()
            }
        }
        self.activityIndicator.stopAnimating()
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    /// table view Delegate and DataSource
    /// - Parameters:
    ///   - tableView: tableView description
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.response.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDataTableViewCell", for: indexPath) as! NewsDataTableViewCell
        cell.descLabel.text = self.viewModel.response[indexPath.row].description
        cell.titleLabel.text = self.viewModel.response[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "UserDetailViewController") as! UserDetailViewController
        let userLogin = viewModel.selectedUserLogin(index: indexPath.row)
        vc.userLogin = userLogin
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
