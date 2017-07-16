//
//  YYHVistorView.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/16.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit

class YYHVistorView: UIView {



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: -懒加载私有控件
    //圆圈
    private lazy var circleView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))

    //小房子
    private lazy var houseView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))

    //提示标签 登录后，别人评论你的微博，发给你的消息，都会在这里收到通知
    private lazy var tipLabel: UILabel = UILabel.cz_label(withText: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", fontSize: 14, color: UIColor.darkGray)

    //注册按钮
    private lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 15, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
    //登录按钮
    private lazy var logInButton: UIButton = UIButton.cz_textButton("登录", fontSize: 15, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)


}

extension YYHVistorView {
    func setupUI() {
        backgroundColor = UIColor.white

        //添加子控件到视图
        addSubview(circleView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(logInButton)

        //取消 autoresizing 与autolayout不能共存
        //自动布局子控件
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        //添加约束
        //给圆圈添加
        addConstraint(NSLayoutConstraint.init(item: circleView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: circleView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: -50))

        //添加小房子
        addConstraint(NSLayoutConstraint.init(item: houseView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: circleView,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: houseView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: circleView,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0))

    }
}
