//
//  YYHWeiBoNetWorking.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/26.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import AFNetworking

class YYHWeiBoNetWorking: AFHTTPSessionManager {

    ///是一个保存在静态区的常量, 执行闭包
    ///在第一次执行该代码时, 执行闭包, 并将结果赋值给shared
    static let shared = YYHWeiBoNetWorking()
    
}
