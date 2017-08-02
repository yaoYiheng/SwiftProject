//
//  WBStatusListViewModel.swift
//  WeiBo
//
//  Created by 姚懿恒 on 2017/8/1.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

import Foundation

/// 微博数据列表视图模型
/*

 关于父类的选择:
 在Swift中的类, 可以不继承自NSObject.
 - 如果类需要使用到'KVC' 或是字典转模型的框架时, 需要继承自NSObject.
 - 如果只是封装了一些方法函数, 则可以不继承NSObject, 更加轻量级
 - 如果使用OC写 , 都需要继承自NSObject
 */
class WBStatusListViewModel {
    //懒加载微博的模型数组
    lazy var statusList = [YYHStatusItem]()

    func loadStatus(completion:@escaping (_ isSuccess: Bool)->()) {

        YYHWeiBoNetWorking.shared.statusList { (json, isSuccess) in
            let array = NSArray.yy_modelArray(with: YYHStatusItem.self, json: json ?? []) as? [YYHStatusItem]
            print(json)
            print(array)
        }

        ///使用封装好的网络请求工具加载微博数据
//        YYHWeiBoNetWorking.shared.statusList { (list, isSuccess) in
//
//
//            //1. 使用YYModel字典转模型
//            //list是[[String : AnyObject]]?键为String, 值为任意对象的可选类型的字典数组, 如果list为nil, 则使用空数组代替,
//            //如果有值, 则将其转成类型为 微博模型的数组[YYHStatusItem]
//            //array 为[YYHStatusItem]?可选类型的微博模型数组
//            //使用guard守护
//
//            guard let array = NSArray.yy_modelArray(with: YYHStatusItem.self, json: list ?? []) as? [YYHStatusItem] else{
//                completion(isSuccess)
//                return
//            }
//            print(array)
//            //2. 完成数据的拼接
//            self.statusList += array
//
//            //3. 完成回调
//            completion(isSuccess)
//
//
//        }
    }
}
