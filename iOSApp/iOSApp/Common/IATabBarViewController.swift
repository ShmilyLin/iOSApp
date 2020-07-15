//
//  IATabBarViewController.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import UIKit

class IATabBarViewController: UITabBarController {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let documentsStoryboard = UIStoryboard(name: "DocumentsStoryboard", bundle: Bundle.main)
        let documentsController = documentsStoryboard.instantiateInitialViewController() as! IANavigationViewController
        documentsController.tabBarItem = UITabBarItem(title: "Documents", image: UIImage(named: "document"), selectedImage: UIImage(named: "document_fill"))
        
        let HIGStoryboard = UIStoryboard(name: "HIGStoryboard", bundle: Bundle.main)
        let HIGController = HIGStoryboard.instantiateInitialViewController() as! IANavigationViewController
        HIGController.tabBarItem = UITabBarItem(title: "HIG", image: UIImage(named: "mobile"), selectedImage: UIImage(named: "mobile_fill"))
        
        self.viewControllers = [documentsController, HIGController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
