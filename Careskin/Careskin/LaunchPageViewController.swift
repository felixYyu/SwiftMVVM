//
//  LaunchPageViewController.swift
//  Careskin
//
//  Created by felixyu on 15/9/16.
//  Copyright (c) 2015年 Careskin. All rights reserved.
//

import UIKit

class LaunchPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageImages = ["@boot/app", "@boot/weinxin","@boot/others"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        //Create the first walkthrough screen
        /*if let startingViewModel = self.viewModelAtIndex(0) {
        setViewControllers([startingViewModel], direction: .Forward, animated: true, completion: nil)
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! LaunchPageContentViewModel).index
        index++
        return self.viewModelAtIndex(index)
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! LaunchPageContentViewModel).index
        index--
        return self.viewModelAtIndex(index)
    }
    
    func viewModelAtIndex(index : Int) -> LaunchPageContentViewModel? {
        if index == NSNotFound || index < 0 || index >= self.pageImages.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        if let pageContentViewModel = storyboard!.instantiateViewControllerWithIdentifier("LaunchPageContentViewModel") as? LaunchPageContentViewModel {
            pageContentViewModel.imageFile = pageImages[index]
            pageContentViewModel.index = index
            return pageContentViewModel
        }
        return nil
    }

}
