//
//  ARNPagingTransitionViewController.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2015/01/05.
//  Copyright (c) 2015 Airin. All rights reserved.
//

import UIKit

public class ARNPagingTransitionViewController: UIViewController {
    
    public lazy var pagingView : ARNPagingTransitionView =  {
        var pagingView = ARNPagingTransitionView(frame: self.view.bounds)
        pagingView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.view.addSubview(pagingView)
        
        return pagingView
    }()

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override public func addChildViewController(childController: UIViewController) {
        self.pagingView.addView(childController.view)
        super.addChildViewController(childController)
        childController.didMoveToParentViewController(self)
    }
}
