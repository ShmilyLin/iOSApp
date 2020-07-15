//
//  IADocumentsTableViewCell.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import UIKit

class IADocumentsTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
