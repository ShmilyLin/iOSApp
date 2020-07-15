//
//  IADocumentModel.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import Foundation
import UIKit

class IADocumentModel {
    
    var name: String!
    var desc: String?
    
    var descHeight: CGFloat = 0
    
    init(name aName: String, desc aDesc: String? = nil) {
        self.name = aName
        self.desc = aDesc
        
        self.calculateDescLabelHeight()
        print("[ IADocumentModel ]", self.name, self.descHeight)
    }
    
    func calculateDescLabelHeight() {
        if let aDesc = self.desc, !aDesc.isEmpty {
            let label = CalculateViewManager.shared.getACalculateLabel(key: .DocumentsDescLabel)
            label.text = aDesc
            label.sizeToFit()
            self.descHeight = label.frame.size.height
        } else {
            self.descHeight = 0
        }
    }
}
