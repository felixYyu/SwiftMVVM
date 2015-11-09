//
//  ViewController.swift
//  Careskin
//
//  Created by felixyu on 15/9/14.
//  Copyright (c) 2015年 Careskin. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSThread.sleepForTimeInterval(3.0)//延长LaunchImage显示时长3秒
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //把引导页加入到程序的第一个页面之前,并保证引导页只在第一次打开时出现
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasViewedWalkthrough = defaults.boolForKey("hasViewedWalkthrough")
        
        if hasViewedWalkthrough == true {
            if let launchPageViewController = storyboard?.instantiateViewControllerWithIdentifier("LaunchPageViewController") as? LaunchPageViewController
            {
                self.presentViewController(launchPageViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

