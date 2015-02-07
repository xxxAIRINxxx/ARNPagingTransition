//
//  ViewController.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2014/12/21.
//  Copyright (c) 2014 Airin. All rights reserved.
//

import UIKit

// FIXME : ローカルPodsからのフレームワーク読み込みがうまくいっていない...
//import ARNPagingTransition

class ViewController: ARNPagingTransitionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.pagingView.animator = ARNPagingCoverflowTransitionAnimator()
        self.pagingView.animator = ARNPagingZoomTransitionAnimator()
        
        var storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc1 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") as UIViewController
        let vc2 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") as UIViewController
        let vc3 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") as UIViewController
        
        self.addChildViewController(vc1)
        self.addChildViewController(vc2)
        self.addChildViewController(vc3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}