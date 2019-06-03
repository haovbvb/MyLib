//
//  Test.swift
//  MyLibDemo
//
//  Created by page on 2019/6/3.
//  Copyright © 2019 page. All rights reserved.
//

import UIKit

import SnapKit

public class Test: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeUI() {
        let v = UIView()
        v.backgroundColor = .red
        addSubview(v)
        v.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
