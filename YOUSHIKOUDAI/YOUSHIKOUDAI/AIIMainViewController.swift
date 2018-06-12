//
//  AIIMainViewController.swift
//  YOUSHIKOUDAI
//
//  Created by JustinChou on 2018/6/12.
//  Copyright © 2018 JustinChou. All rights reserved.
//

import UIKit
import Alamofire

class AIIMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    static let KeyIdentifyId = "kAIIMainTableViewCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = UIColor.white
        
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AIIMainTableViewCell", bundle: nil), forCellReuseIdentifier: AIIMainViewController.KeyIdentifyId)
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AIIMainViewController.KeyIdentifyId, for: indexPath) as! AIIMainTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
