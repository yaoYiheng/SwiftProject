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


}

extension YYHVistorView {
    func setupUI() {
        backgroundColor = UIColor.white

    }
}
