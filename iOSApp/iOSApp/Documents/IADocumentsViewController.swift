//
//  IADocumentsViewController.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import UIKit

class IADocumentsViewController: IABasicViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var documentsList: [IADocumentModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "文档"
        
        self.loadDocuments()
    }
    
    func loadDocuments() {
        self.documentsList = [
            IADocumentModel(name: "Core Animation", desc: "渲染，合成和动画化视觉元素。"),
            IADocumentModel(name: "Core Audio Kit", desc: "将用户界面添加到音频单元。"),
            IADocumentModel(name: "Core Graphics", desc: "利用Quartz技术的力量执行具有高保真输出的轻量级2D渲染。 处理基于路径的绘图，抗锯齿渲染，渐变，图像，颜色管理，PDF文档等。"),
            IADocumentModel(name: "Core Image", desc: "使用内置或自定义过滤器来处理静止图像和视频图像。"),
            IADocumentModel(name: "Foundation", desc: "访问基本数据类型，集合和操作系统服务，是定义应用程序功能的基础层。"),
            IADocumentModel(name: "IOKit", desc: "在用户空间中访问硬件设备和驱动程序。"),
            IADocumentModel(name: "Local Authentication", desc: "用生物特征识别或使用他们已经知道的密码对用户进行身份验证。"),
            IADocumentModel(name: "UIKit", desc: "为iOS或tvOS应用程序构建和管理事件驱动的图形用户界面。"),
            IADocumentModel(name: "User Notifications", desc: "将面向用户的通知从服务器推送到用户的设备，或从你的应用本地生成。"),
            IADocumentModel(name: "WebKit", desc: "在Windows中显示Web内容。 实现浏览器功能，例如跟随用户激活的链接，管理后退列表，以及管理最近访问的页面的历史记录。"),
        ]
        
        self.tableView.reloadData()
    }
    

    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.documentsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.documentsList[indexPath.row]
        return 10 + 24 + 6 + model.descHeight + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IADocumentsTableViewCell", for: indexPath) as! IADocumentsTableViewCell
        let model = self.documentsList[indexPath.row]
        cell.mainLabel.text = model.name
        if model.desc != nil, !model.desc!.isEmpty {
            cell.descLabel.isHidden = false
            cell.descLabel.text = model.desc!
        } else {
            cell.descLabel.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
