//
//  ViewController.swift
//  MyLibDemo
//
//  Created by page on 2019/5/30.
//  Copyright © 2019 page. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let line = UIView(frame: CGRect(x: 50, y: 50, width: 300, height: 50))
        line.addLineBottom(UIColor.red)
        view.addSubview(line)
        
        let test = Test(frame: CGRect(x: 50, y: 100, width: 90, height: 80))
        view.addSubview(test)
    }


}

