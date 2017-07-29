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

/// 对AFN的方法进行封装
class YYHWeiBoNetWorking: AFHTTPSessionManager {

    ///是一个保存在静态区的常量, 执行闭包
    ///在第一次执行该代码时, 执行闭包, 并将结果赋值给shared
    static let shared = YYHWeiBoNetWorking()


    /// 访问令牌, 除登录以外的所有网络请求都基于此令牌
    var accessToke:String? = "2.00ALgzxBT1mqVE91080efb59FfSqJC"


    ///新增一个方法, 专门用来处理token, 使得在之后的需要用到token的方法中, 直接调用该方法
    func tokenRequest(method: WBHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool )->()) -> Void {

        //0.判断token
        guard let token = accessToke else {
            //如果token为nil
            print("先获取token")
            //执行回调
            completion(nil, false)
            return
        }

        //1.判断参数字典
        var parameter = parameters
        if parameter == nil {
            //如果字典为空, 实例化字典
            parameter = [String: AnyObject]()
        }
        //设置字典参数
        parameter!["access_token"] = token as AnyObject

        //3. 调用已封装好的方法, 发起真正的网络请求
        request(URLString: URLString, parameters: parameter, completion: completion)
    }

    /// 使用一个函数封装AFN GET/POST请求
    ///
    /// - Parameters:
    ///   - method: GET/POST
    ///   - URLString: URLString
    ///   - parameters: 参数字典
    ///   - completion: 完成回调[json(字典/数组), 是否成功]
    func request(method: WBHTTPMethod = .GET, URLString: String, parameters: [String: AnyObject]?, completion: @escaping (_ json: AnyObject?, _ isSuccess: Bool )->()) {

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
