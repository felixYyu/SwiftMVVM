//
//  ViewController.swift
//  Careskin
//
//  Created by felixyu on 15/9/14.
//  Copyright (c) 2015年 Careskin. All rights reserved.
//

import UIKit
import SwiftHTTP

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSThread.sleepForTimeInterval(3.0)//延长LaunchImage显示时长3秒
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //把引导页加入到程序的第一个页面之前
        if let launchPageViewController = storyboard?.instantiateViewControllerWithIdentifier("LaunchPageViewController") as? LaunchPageViewController {
            self.presentViewController(launchPageViewController, animated: true, completion: nil)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

