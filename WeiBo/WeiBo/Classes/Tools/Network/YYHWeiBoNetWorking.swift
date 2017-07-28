//
//  YYHWeiBoNetWorking.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/7/26.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import UIKit
import AFNetworking
enum WBHTTPMethod {
    case GET
    case POST
}

class YYHWeiBoNetWorking: AFHTTPSessionManager {

    ///是一个保存在静态区的常量, 执行闭包
    ///在第一次执行该代码时, 执行闭包, 并将结果赋值给shared
    static let shared = YYHWeiBoNetWorking()

    //使用一个函数封装GET/POST请求

    /// 使用一个函数封装AFN GET/POST请求
    ///
    /// - Parameters:
    ///   - method: GET/POST
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - completion: 完成回调[json(字典/数组), 是否成功]
    func request(method: WBHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject], completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool )->()) {

        //请求成功的闭包
        let success = { (task: URLSessionDataTask, json: Any?) in
            completion(json as AnyObject, true)
        }
        //请求失败的闭包
        let failure = { (task: URLSessionDataTask?, error: Error) -> () in
            completion(nil, false)
        }

        if method == .GET {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        else{
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }


    }

//    func request(method:WBHTTPMethod = .GET,URLString:String,parameters:[String:AnyObject],completion:@escaping (_ json:AnyObject?,_ isSucess:Bool)->()) {
//
//        //成功回调
//        let sucess = { (task: URLSessionDataTask, json: Any?) in
//            completion((json as? [String: Any])! as AnyObject, true)
//            //            print(json)
//        }
//        //失败回调
//        let failure = { (task: URLSessionDataTask?, error:Error) in
//            print("网络请求 \(error)")
//            completion(nil, false)
//        }
//
//
//
//
//        if method == .GET {
//            get(URLString, parameters: parameters, progress: nil, success: sucess, failure: failure)
//        }else {
//            post(URLString, parameters: parameters, progress: nil, success: sucess, failure: failure)
//        }
//
//    }

}
