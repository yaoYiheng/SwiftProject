//
//  YYHViewController.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/6/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit


///全局变量
private let cellID = "cellID"

class YYHViewController: YYHBaseTableController {



    ///懒加载假数据
    private lazy var statusList = [String]()


    override func loadData() {
        ///模拟延迟加载数据
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {

            //使用封装的网络工具 发送网络请求
            let urlSring = "https://api.weibo.com/2/statuses/home_timeline.json"
            //请求参数字典
            let parameter = ["access_token": "2.00ALgzxBT1mqVE91080efb59FfSqJC"]
            YYHWeiBoNetWorking.shared.get(urlSring, parameters: parameter, progress: nil, success: { (_, json) in
                print(json ?? "")
            }, failure: { (_, error) in
                print("网络请求失败\(error)")
            })


            
            //加载假数据
            for item in 0..<20 {
                //如果是上拉刷新, 就追加到数组尾部
                if self.isPullUp {
                    self.statusList.append("上拉\(item)")

                }//下拉刷新时, 将新数据添加到数组的前面
                else{
                    self.statusList.insert(item.description, at: 0)
                }
            }
            //结束上拉
            self.isPullUp = false
            //刷新表格
            self.tableView?.reloadData()

            //结束刷新
            self.refreshControl?.endRefreshing()
        }

    }

    ///显示好友
    @objc private func showFriends() {
        print(#function)
        //push出DemoVC
        let vc = YYHDemoTableViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension YYHViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. 创建cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        //2. 设置item
        cell.textLabel?.text = statusList[indexPath.row]

        //3. 返回cell
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
}

extension YYHViewController {

    override func setupTableView() {
        super.setupTableView()
        //通过为BarButtonItem抽取 便利构造函数, 快速创建button
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", fontSize: 18, target: self, action: #selector(showFriends), isBack: false)

        //注册cell, 在OC中写的是UITableViewCell.class, 这里是UITableViewCell.self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
     ///错误: Declarations in extensions cannot override yet
    /// Override of instance method 'setupUI()' from extension of 'YYHBaseTableController' depends on deprecated inference of '@objc'
//    override func setupUI() {
//        super.setupUI()

        
        //设置导航条左边的按钮, 系统自带的无法满足需要
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))

        //通过自定义View, 定制所需要的能够显示高亮的按钮
//        let button: UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//
//        button.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)

        //通过为BarButtonItem抽取 便利构造函数, 快速创建button
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "好友", fontSize: 18, target: self, action: #selector(showFriends), isBack: false)
//
//        //注册cell, 在OC中写的是UITableViewCell.class, 这里是UITableViewCell.self
//        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
//    }

}
