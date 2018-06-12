//
//  AIIMainViewController.swift
//  YOUSHIKOUDAI
//
//  Created by JustinChou on 2018/6/12.
//  Copyright © 2018 JustinChou. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class AIIMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var dataArray: [AdvertisementModel]?
    static let KeyIdentifyId = "kAIIMainTableViewCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        
        setupUI()
        
        handleData()
    }

    func setupUI() {
        view.backgroundColor = UIColor.white
        
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AIIMainTableViewCell", bundle: nil), forCellReuseIdentifier: AIIMainViewController.KeyIdentifyId)
        view.addSubview(tableView)
    }
    
    func handleData() {
        Alamofire.request("http://static.youshikoudai.com/mockapi/data").responseJSON { (response) in
            if response.result.isSuccess {
                let dataList = response.value as! [[String : Any]]
                self.dataArray = Mapper<AdvertisementModel>().mapArray(JSONArray: dataList)
                
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func didClickButtonA() {
        self.navigationController?.pushViewController(AViewController(), animated: true)
    }
    
    @objc func didClickButtonB() {
        self.navigationController?.pushViewController(BViewController(), animated: true)
    }
    
    
    
    // MARK:- about tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = dataArray else {
            return 0
        }
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AIIMainViewController.KeyIdentifyId, for: indexPath) as! AIIMainTableViewCell
        
        cell.model = dataArray?[indexPath.row]
        cell.buttonA.addTarget(self, action: #selector(didClickButtonA), for: .touchUpInside)
        cell.buttonB.addTarget(self, action: #selector(didClickButtonB), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}
