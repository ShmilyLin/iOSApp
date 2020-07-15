//
//  IAHIGTableViewHeaderView.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import UIKit

protocol IAHIGTableViewHeaderViewDelegate: NSObjectProtocol {
    func HIGTableViewHeaderViewDidSelect(_ headerView: IAHIGTableViewHeaderView, section: Int)
}

class IAHIGTableViewHeaderView: UITableViewHeaderFooterView {
    
    weak var delegate: IAHIGTableViewHeaderViewDelegate?
    
    var section: Int = 0
    
    let mainLabel: UILabel = {
        let tempLabel = UILabel(frame: CGRect.zero)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return tempLabel
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.mainLabel)
        self.contentView.addConstraint(NSLayoutConstraint(item: self.mainLabel, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 20.0))
        self.contentView.addConstraint(NSLayoutConstraint(item: self.mainLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectViewEvent(gestureRecognizer:)))
        self.contentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didSelectViewEvent(gestureRecognizer: UITapGestureRecognizer) {
        self.delegate?.HIGTableViewHeaderViewDidSelect(self, section: self.section)
    }
}
