//
//  CalculateViewManager.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import Foundation
import UIKit

struct CalculateViewModel {
    var timer: Timer
    var view: UIView
}

class CalculateViewManager {
    enum LabelKeys {
        case DocumentsDescLabel
    }
    
    static let shared = CalculateViewManager()
    
    private var viewList: [LabelKeys: CalculateViewModel] = [:]
    
    private init() {}
    
    func getACalculateLabel(key: LabelKeys) -> UILabel {
        if var model = self.viewList[key] {
            model.timer.invalidate()
            model.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                let removeModel = self.viewList.removeValue(forKey: key)
                removeModel?.timer.invalidate()
                print("[ CalculateViewManager ] timer remove 1")
            }
            
            model.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 60, height: 0)
            return model.view as! UILabel
        }
        
        let tempLabel = UILabel(frame: CGRect.zero)
        switch key {
        case .DocumentsDescLabel:
            tempLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 60, height: 0)
            tempLabel.textColor = UIColor.gray
            tempLabel.font = UIFont.systemFont(ofSize: 14)
            tempLabel.numberOfLines = 0
            tempLabel.lineBreakMode = .byTruncatingTail
            tempLabel.baselineAdjustment = .alignBaselines
            tempLabel.textAlignment = .natural
        }
        
        self.viewList[key] = CalculateViewModel(timer: Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            let removeModel = self.viewList.removeValue(forKey: key)
            removeModel?.timer.invalidate()
            print("[ CalculateViewManager ] timer remove 2")
        }, view: tempLabel)
        
        return tempLabel
    }
}
