//
//  YYHTabBarViewController.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/6/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//警告: The use of Swift 3 @objc inference in Swift 4 mode is deprecated. Please address deprecated @objc inference warnings, test your code with “Use of deprecated Swift 3 @objc inference” logging enabled, and disable Swift 3 @objc inference.

import UIKit

class YYHTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置所有子控制器
        configureChildrenControllers()

        //添加撰写按钮
        configureComposeButton()

    }

    //MARK: -监听撰写按钮的点击方法
    //private 保证该方法私有, 仅在当前对象被访问
    // @objc 运行这个函数在运行时, 通过OC的消息机制被调用, 即使是私有的函数
    // 既能保证方法的安全, 又能保证方法通过 '运行时' 被调用
    @objc private func composeButtonClick() {

        print("撰写微博")

    }

    //MARK: -支持横竖屏
    /// 重写
    /*
     portrait 竖屏, 肖像画
     landscape 横屏, 风景画
     可以在项目tagert里设置横竖屏, 但是使用代码的好处在于, 可以在需要横屏显示的时候单独设置
     设置支持的方向之后, 当前的控制器及其子控制器都会遵守这个方向.该方法写在tabBarVC中, 其子控制器为navigationVC下的控制器都会遵守
     如果需要播放视频, 通常是通过modal显示
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
    //MARK: -私有控件
    ///撰写按钮, 懒加载
    private lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")

}
/*
 extension类似于OC中的分类, 在Swift中还可以用来切分代码块
 可以把功能相近的函数, 放在一个extension中
 注意: 与OC一样 不能再extension中定义属性
 */
// MARK: - 设置界面

extension YYHTabBarViewController{

    ///设置撰写按钮
    private func configureComposeButton() {
        tabBar.addSubview(composeButton)

        //计算每个按钮的宽度
        let count = CGFloat(childViewControllers.count)

        // 将按钮宽度减小1, 就能使撰写按钮变大, 从而覆盖容错点
        let buttonW = tabBar.bounds.width / count - 1

        //布局撰写按钮
        //insetBy相当于OC中的CGRectInset, 正数向内缩进, 负数向外扩大
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * buttonW, dy: 0)

        //为按钮添加方法
        composeButton.addTarget(self, action: #selector(composeButtonClick), for: .touchUpInside)


    }

    /// 设置所有子控制器
   private func configureChildrenControllers() {

        //控制器字典数组
        let controllerDictInArray = [
            ["className": "YYHViewController", "title": "首页", "imageName": "home"],
            ["className": "YYHMessageViewController", "title": "消息", "imageName": "message_center"],
            //添加中间的撰写按钮,由于其他值都是无效的, 调用controller方法时会返回一个UIViewController
            ["className": "UIViewController"],
            ["className": "YYHDiscoverViewController", "title": "发现", "imageName": "discover"],
            ["className": "YYHProfileViewController", "title": "我", "imageName": "profile"]

        ]

        //控制器数组
        var controllerArray = [UIViewController]()

        for dict in controllerDictInArray {

            controllerArray.append(controller(dictionary: dict))
        }
        viewControllers = controllerArray


    }


    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dictionary: 信息字典[className, title, imageName]
    /// - Returns: 子控制器
    private func controller(dictionary: [String: String]) -> UIViewController{

        //1. 获取字典内容
        guard let className = dictionary["className"],
            let title = dictionary["title"],
            let imageName = dictionary["imageName"],
            let viewController = NSClassFromString(Bundle.main.namespace + "." + className) as? UIViewController.Type

            else{

            return UIViewController()
        }


        //2. 创建视图控制器
        //使用之前获取到的类, 实例化
        let realVC = viewController.init()

        realVC.title = title

        //设置图像
        realVC.tabBarItem.image = UIImage.init(named: "tabbar_" + imageName)?.withRenderingMode(.alwaysOriginal)
        realVC.tabBarItem.selectedImage = UIImage.init(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)

        //通过标题属性字典,设置字体颜色大小
        // 之前的设置颜色的key[NSForegroundColorAttributeName] 已经改为:NSAttributedStringKey.foregroundColor
        realVC.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor : UIColor.orange],
            for: .selected)
        
        //更改字体大小 NSFontAttributeName 改成:NSAttributedStringKey.font
        //注意: 必须将字体状态设置为normal, 颜色以及大小的设置才会生效!
        realVC.tabBarItem.setTitleTextAttributes(
            [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)],
            for: .normal)

        //创建导航控制器

        let navigationVC = YYHNavigationController.init(rootViewController: realVC)

        return navigationVC



    }

}
