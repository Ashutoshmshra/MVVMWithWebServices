//
//  UserDetailViewController.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    @IBOutlet weak var containerView:UIView?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var nameDataLabel: UILabel?
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    private let viewModel = UserDataViewModel()
    private let homeVC = HomeViewController()

    public var userLogin: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        addShadowOnContainerView()
        loadDataFromViewModel()
    }
    /// Add Shadow On ContainerView Data
    private func addShadowOnContainerView(){
        self.navigationItem.title = "UserData"
        containerView?.layer.shadowColor = UIColor.black.cgColor
        containerView?.layer.shadowOpacity = 0.33
        containerView?.layer.shadowOffset = .zero
        containerView?.layer.shadowRadius = 10
    }
    /// Load View model data
    private func loadDataFromViewModel(){
        homeVC.activityIndicator.startAnimating()
        guard let login = userLogin else { return }
        viewModel.user(login: login) { [weak self] in
            if let url = self?.viewModel.imageURL {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                } catch _ { }
            }
            DispatchQueue.main.async {
                self?.nameLabel?.text = self?.viewModel.name
                self?.loginLabel.text = self?.viewModel.username
                self?.bioLabel.text = self?.viewModel.bio
                self?.nameDataLabel?.text = self?.viewModel.username
            }
        }
        homeVC.activityIndicator.stopAnimating()
    }
    

}
