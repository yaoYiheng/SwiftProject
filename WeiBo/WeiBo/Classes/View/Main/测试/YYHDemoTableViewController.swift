//
//  YYHDemoTableViewController.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/1.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class YYHDemoTableViewController: YYHBaseTableController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "第\(navigationController?.childViewControllers.count ?? 0)个页面"
    }

    /// push出新的Demo控制器
    @objc private func showNext() {

        let vc = YYHDemoTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension YYHDemoTableViewController {

    override func setupTableView() {
        super.setupTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", fontSize: 19, target: self, action: #selector(showNext), isBack: false)
    }


    ///重写父类的方法, 但是不要忘记调用super
//    override func setupUI() {
//        super.setupUI()

//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", fontSize: 19, target: self, action: #selector(showNext), isBack: false)
//
//
//    }
}
