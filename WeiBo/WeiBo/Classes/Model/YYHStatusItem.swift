//
//  YYHStatusItem.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/31.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import YYModel


/// 通过查看API编写微博模型
class YYHStatusItem: NSObject {

    /// Int64, 在64位的机器上是64位, 32则是32位
    /// 如果不声明类型为Int64, 则无法运行在iPad2/iPhone5/5c/4/4s上
    var id: Int64 = 0

    /// 微博信息内容
    var text: String?

    /// 重写计算型属性description
    override var description: String{

        return yy_modelDescription()
    }
    

}
