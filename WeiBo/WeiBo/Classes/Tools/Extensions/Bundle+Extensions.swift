//
//  Bundle+Extensions.swift
//  反射机制抽取namespace
//
//  Created by 姚懿恒 on 2017/6/23.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import Foundation

extension Bundle{

    //返回命名控件的字符串
    func nameSpace() -> String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }

    //计算型属性类似于函数, 没有参数, 有返回值
    var namespace: String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }


}
