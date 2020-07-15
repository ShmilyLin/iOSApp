//
//  IAHIGViewController.swift
//  iOSApp
//
//  Created by LinJia on 2020/7/14.
//  Copyright © 2020 lin. All rights reserved.
//

import UIKit

class IAHIGViewController: IABasicViewController, UITableViewDelegate, UITableViewDataSource, IAHIGTableViewHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var higList: [IAHIGModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Human Interface Guidelines"
        
        self.tableView.register(IAHIGTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "IAHIGTableViewHeaderView")
        self.tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "IAHIGTableViewFooterView")

        self.loadList()
    }
    
    func loadList() {
        self.higList = [
            IAHIGModel(name: "iOS", children: [
                "Themes",
                "Mac Catalyst",
                "Interface Essentials"
            ]),
            IAHIGModel(name: "App Architecture", children: [
                "Launching",
                "Onboarding",
                "Loading",
                "Modality",
                "Navigation",
                "Requesting Permission",
                "Settings"
            ]),
            IAHIGModel(name: "User Interaction", children: [
                "3D Touch",
                "Apple Pencil",
                "Audio",
                "Authentication",
                "Data Entry",
                "Drag and Drop",
                "Feedback",
                "File Handling",
                "Game Controllers",
                "Gestures",
                "Haptics",
                "Near Field Communication",
                "Pointers (iPadOS)",
                "Undo and Redo"
            ])
        ]
        
        self.tableView.reloadData()
    }
    

    // MARK: - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.higList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.higList[section]
        return model.show ? model.children.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = self.higList[section]
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "IAHIGTableViewHeaderView") as! IAHIGTableViewHeaderView
        headerView.delegate = self
        headerView.section = section
        headerView.mainLabel.text = model.name
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "IAHIGTableViewFooterView")
        footerView?.contentView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IAHIGTableViewCell", for: indexPath) as! IAHIGTableViewCell
        let model = self.higList[indexPath.section]
        cell.textLabel?.text = model.children[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - IAHIGTableViewHeaderViewDelegate
    func HIGTableViewHeaderViewDidSelect(_ headerView: IAHIGTableViewHeaderView, section: Int) {
        let model = self.higList[section]
        model.show = !model.show
        self.tableView.reloadSections(IndexSet(arrayLiteral: section), with: .automatic)
    }

}
