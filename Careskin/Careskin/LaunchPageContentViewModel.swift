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
    //引导页的顺序号
    var index : Int = 0
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.contentImageView.image = UIImage(named: imageFile)
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

}
