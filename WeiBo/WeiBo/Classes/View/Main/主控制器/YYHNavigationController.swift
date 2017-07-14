//
//  YYHNavigationController.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/6/25.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class YYHNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationBar.isHidden = true

        setFullScreenPopBack()

    }

    @objc private func popBack() {
        popViewController(animated: true)
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //根控制器不需要处理, 非根控制器时, 才需要隐藏
        //我理解的根控制器: 就是最开始的rootVC
        //childViewControllers不包括任何已存在的控制器
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true

            //
            if let vc = viewController as? YYHBaseTableController{

                var title = "返回"
                //判断控制器的级数, 只有一个子控制器时, 才显示栈底控制器的标题
                if childViewControllers.count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                }

                vc.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: title, fontSize: 18, target: self, action: #selector(popBack), isBack: true)
            }
        }
        super.pushViewController(viewController, animated: true)
    }
}
extension YYHNavigationController: UIGestureRecognizerDelegate {
    ///重写back后, 滑动返回的效果消失,
    //添加全屏滑动返回.
    private func setFullScreenPopBack() {

        guard let systemGes = interactivePopGestureRecognizer else { return }
        //2获取手势添加的view
        guard let gesView = systemGes.view else { return }
        //3.1获取target action
        //利用运行时机制查看对应属性名称
        /*
         var count : UInt32 = 0
         let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
         for i in 0..<count {
         let ivar = ivars[Int(i)]
         let name = ivar_getName(ivar)
         //打印所有属性
         print(String(cString: name!))
         }
         */
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        //        print(targetObjc)//打印拿到到的target字典
        //3.2取出target
        guard let target = targetObjc.value(forKey: "target") else { return }
        //3.3取出target
        let action = Selector(("handleNavigationTransition:"))

        //4 创建自己的手势pan
        let panGes = UIPanGestureRecognizer()
        panGes.delegate = self
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
    }
    //实现手势代理方法, 只有当不是根控制器时, 才允许手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return self.viewControllers.count != 1
    }
}
