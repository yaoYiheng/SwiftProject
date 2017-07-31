//
//  YYHWeiBoNetWorking+Extensions.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/29.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import Foundation

// MARK: - 封装新浪微博的网络请求方法
extension YYHWeiBoNetWorking{


    /// 加载微博数据字典完成回调
    /// 注意力在回调的类型上, 不关心网络实现细节
    /// - Parameter completion: 完成回调[list字典数组]
    func statusList(completion: @escaping (_ list: [[String: AnyObject]]?, _ isSuccess: Bool)->()) {
        //使用封装的网络工具 发送网络请求
        let urlSring = "https://api.weibo.com/2/statuses/home_timeline.json"
        //请求参数字典
//        let parameter:[String: AnyObject] = ["access_token": "2.00ALgzxBT1mqVE91080efb59FfSqJC" as AnyObject]

        tokenRequest(URLString: urlSring, parameters: nil) { (json, isSuccess) in

            //从json中取出 以statuses为key的字典数组
            let result = json?["statuses"] as? [[String: AnyObject]]

            completion(result, isSuccess)
        }

        //使用已封装的函数
//        request(URLString: urlSring, parameters: parameter, completion: { (json, isSuccess) in
//
//
//            let result = json?["statuses"] as? [[String: AnyObject]]
//
//            //执行回调
//            completion(result, isSuccess)
//
//        })
    }
}
