//
//  NewsDataTableViewCell.swift
//  MVVMWithAPIDemo
//
//  Created by Ashutosh on 25/12/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import UIKit

class NewsDataTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.61
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 7

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
