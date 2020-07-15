//
//  IAHIGModel.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import Foundation

class IAHIGModel {
    var name: String!
    var children: [String] = []
    
    var show = false
    
    init(name aName: String, children childrenList: [String]? = nil) {
        self.name = aName
        
        if childrenList != nil {
            self.children = childrenList!
        }
    }
}
