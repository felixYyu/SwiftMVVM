//
//  LaunchPageContentViewModel.swift
//  Careskin
//
//  Created by felixyu on 15/9/16.
//  Copyright (c) 2015年 Careskin. All rights reserved.
//

import UIKit

class LaunchPageContentViewModel: UIViewController {

    @IBOutlet weak var contentImageView : UIImageView!
    @IBOutlet weak var pageControl : UIPageControl!
    @IBOutlet weak var startedButton : UIButton!
    //引导页的顺序号
    var index : Int = 0
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentImageView?.image = UIImage(named: imageFile)
        pageControl?.currentPage = index
        startedButton?.hidden = (index == 2) ? false : true
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
    
    @IBAction func close(sender: AnyObject) {
        //保证引导页只在第一次打开时出现
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(false, forKey: "hasViewedWalkthrough")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changeScreen(sender: UIPageControl) {
        if let parentPageViewController = self.parentViewController as? LaunchPageViewController {
            parentPageViewController.changeModel(sender.currentPage)
        }
    }

}
