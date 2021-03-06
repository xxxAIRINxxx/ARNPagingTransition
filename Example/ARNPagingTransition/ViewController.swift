//
//  ViewController.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2014/12/21.
//  Copyright (c) 2014 Airin. All rights reserved.
//

import UIKit

class ViewController: ARNPagingTransitionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pagingView.animator = ARNPagingCoverflowTransitionAnimator()
        //self.pagingView.animator = ARNPagingZoomTransitionAnimator()
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc1 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") 
        let vc2 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") 
        let vc3 : UIViewController = storyboard.instantiateViewControllerWithIdentifier("vc") 
        
        self.addChildViewController(vc1)
        self.addChildViewController(vc2)
        self.addChildViewController(vc3)
    }
}