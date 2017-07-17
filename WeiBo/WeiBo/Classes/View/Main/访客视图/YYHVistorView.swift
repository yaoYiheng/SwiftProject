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

    //蒙板
    private lazy var coverView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"))
    //小房子
    private lazy var houseView: UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))

    //提示标签 登录后，别人评论你的微博，发给你的消息，都会在这里收到通知
    private lazy var tipLabel: UILabel = UILabel.cz_label(withText: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", fontSize: 14, color: UIColor.darkGray)

    //注册按钮
    private lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 15, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, backgroundImageName: "common_button_white_disable")
    //登录按钮
    private lazy var logInButton: UIButton = UIButton.cz_textButton("登录", fontSize: 15, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, backgroundImageName: "common_button_white_disable")


}

extension YYHVistorView {
    func setupUI() {
        backgroundColor = UIColor.white

        //添加子控件到视图
        addSubview(circleView)
        addSubview(coverView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(logInButton)

        //取消 autoresizing 与autolayout不能共存
        //自动布局子控件
        for view in subviews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }


        /*
         自动布局构造函数公式:
         item1.attribute1 = multiplier × item2.attribute2 + constant

         item: 待添加约束的视图,
         attribute: 约束的属性,
         relatedBy: 约束关系, == >= <=,
         toItem: 参照视图,
         attribute: 参照属性,
         multiplier: 乘积,
         constant: 约束数值

         如果指定 宽 高:
         参照视图设为: nil
         参照属性设置为: .nonattribute
         */

        let margin: CGFloat = 20
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

        //添加标签
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 50))
        addConstraint(NSLayoutConstraint.init(item: tipLabel,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 250))
        //注册按钮
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))

        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        addConstraint(NSLayoutConstraint.init(item: registerButton,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 50))
        //注册按钮
        addConstraint(NSLayoutConstraint.init(item: logInButton,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: logInButton,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: tipLabel,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: margin))

        addConstraint(NSLayoutConstraint.init(item: logInButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 100))
        addConstraint(NSLayoutConstraint.init(item: logInButton,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1.0,
                                              constant: 50))
        /*
        addConstraint(NSLayoutConstraint.init(item: coverView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0))
        addConstraint(NSLayoutConstraint.init(item: coverView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: registerButton,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 0))
         */

        //添加遮盖
        /*
         views: 定义 VFL 的控件名称与实际名称的映射关系
         metrics: 定义 VFL 中()中指定的常数映射关系
         */
        let viewDict:[String: Any] = ["coverView": coverView,
                        "registerButton": registerButton]
        let metrics = ["spacing": -50]


        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[coverView]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: viewDict))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[coverView]-(spacing)-[registerButton]",
                                                      options: [],
                                                      metrics: metrics,
                                                      views: viewDict))
    }



}
