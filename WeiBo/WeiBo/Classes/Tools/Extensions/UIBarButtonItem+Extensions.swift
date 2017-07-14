//
//  UIBarButtonItem+Extensions.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/3.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

extension UIBarButtonItem{


    /// 创建UIBarButtonItem
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize 默认16
    ///   - target: target description
    ///   - action: action description
    convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector, isBack: Bool) {
        let button: UIButton = UIButton.cz_textButton(title, fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)


        if isBack {

            let imageName = "navigationbar_back_withtext"
            button.setImage(UIImage.init(named: imageName), for: .normal)
            button.setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)

        }
        button.addTarget(target, action: action, for: .touchUpInside)

        //self.init 实例化
        self.init(customView: button)
    }
}
