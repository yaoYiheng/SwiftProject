//
//  YYHBaseTableController.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/6/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
///面试题: OC中是否支持多继承?如果不支持用什么代替?
//答: 不支持多继承, 使用协议代替.

///在Swift中使用extension将'函数'按照功能进行划分, 便于阅读与维护
/*
 注意:
 1.extension中不能有属性
 2.extension中不能重写父类的方法! 重写是子类的职责, extension是对类的扩展
 */

///基类控制器
class YYHBaseTableController: UIViewController {

    //是否登录
    var isLogon = true

    //访客视图信息字典
    var visitorInfoDict: [String: String]?


    ///表格控件
    var tableView: UITableView?

    ///刷新控件
    var refreshControl: UIRefreshControl?

    var isPullUp = false


    /// 自定义导航条
//    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    /// 自定义的导航条目 - 以后设置导航栏内容，统一使用 navItem
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    /// 重写 title 的 didSet
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }

}
///添加监听方法
extension YYHBaseTableController{

    @objc private func register() {
        print("注册")
    }
    @objc private func login() {
        print("登录")
    }
}
///设置UI
extension YYHBaseTableController {
  @objc private func setupUI() {
    view.backgroundColor = UIColor.cz_random()

    setNavigationBar()


    isLogon ? setupTableView() : setupVisitorView()

    }
    ///加载访客视图
    private func setupVisitorView() {
        let visitorView = YYHVistorView.init(frame: view.bounds)
//        visitorView.backgroundColor = UIColor.cz_random()

        //通过外界赋值给visitorView的字典属性
        visitorView.visitorInfo = visitorInfoDict

        //监听方法
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        visitorView.logInButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(visitorView)

        //添加导航栏按钮
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(register))

        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(login))

//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", target: self, action: #selector(register), isBack: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(register))

        //
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", fontSize: 16, target: self, action: #selector(register), normal: UIColor.orange, highlighted: UIColor.darkGray, isBack: false)
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "登录", fontSize: 16, target: self, action: #selector(login), normal: UIColor.orange, highlighted: UIColor.darkGray, isBack: false)
    }


    ///加载表格视图
    @objc func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)

        //设置代理以及数据源
        tableView?.delegate = self
        tableView?.dataSource = self

        view.addSubview(tableView!)

        //设置UIRefreshControl
        setupUIRefresh()


    }

    ///设置UIRefreshControl
    private func setupUIRefresh() {
        ///设置刷新控件
        //创建UIRefresh
        refreshControl = UIRefreshControl()
        //设置UIRefresh颜色
        refreshControl?.tintColor = UIColor.orange
        //设置UIRefresh文字内容
        let string = NSAttributedString.init(string: "123")
        refreshControl?.attributedTitle = string

        //添加到tableView
        tableView?.addSubview(refreshControl!)

        //监听方法用户下拉时, 触发UIControlEventValueChanged事件
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    ///加载数据, 具体实现有子类负责
   @objc func loadData(){
        //当子类没有实现该方法时, 默认关闭刷新
        refreshControl?.endRefreshing()

    }
    ///设置导航条
    private func setNavigationBar() {


//        //设置tintColor UIBarButtonItem, 具体的按钮的颜色
        self.navigationController?.navigationBar.tintColor = UIColor.orange
//
//        //titleTextAttributes 设置中间标题的属性
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.red]
//
//        //设置整个导航条的颜色
//        self.navigationController?.navigationBar.barTintColor = UIColor.blue

//        view.addSubview(navigationBar)
//
//        // 将 item 设置给 bar
//        navigationBar.items = [navItem]

//        // 1> 设置 navBar 整个背景的渲染颜色
//        NavigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
//        // 2> 设置 navBar 的字体颜色
//        NavigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.red]
//        // 3> 设置系统按钮的文字渲染颜色
//        NavigationBar.tintColor = UIColor.orange
    }
}
//MARK: -tableView代理数据源方法
extension YYHBaseTableController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    //基类复制准备方法, 子类负责具体实现
    //子类的数据源方法不需要super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //保证语法没有错误
        return UITableViewCell()
    }

    ///判断即将显示的那一行cell, 如果是最后一行就上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //当即将显示的那一行是的section, row最大时, 才是最后一行
        let row = indexPath.row

        let section = tableView.numberOfSections - 1

        if row < 0 || section < 0 {
            return
        }
        //如果来到这里, 说明有最后一行

        //最后一行的行数
        let lastRow = tableView.numberOfRows(inSection: section) - 1
        //最后一行,且没有开始刷新则开始刷新
        if row == lastRow && !isPullUp {
            print("上拉刷新\(cell.textLabel?.text ?? "")")
            //标记上拉刷新
            isPullUp = true

            //开始刷新
            loadData()
        }

    }
}
