//
//  ARNPagingTransitionView.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2015/01/05.
//  Copyright (c) 2015 Airin. All rights reserved.
//

import UIKit

public enum SlideDirection : Int {
    case left
    case right
}

public protocol ARNPagingTransitionAnimator {
     func update(sourceView: UIView, destinationView: UIView?, withpercent: CGFloat, direction: SlideDirection)
}

public class ARNPagingTransitionView: UIView, UIScrollViewDelegate {

    public var animator : ARNPagingTransitionAnimator?
    public var views : [UIView] = []
    public var currentIndex : Int = 0
    
    var beginOffset : CGFloat = 0.0
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public lazy var scrollView : UIScrollView = {
        var scrollView = UIScrollView(frame: self.bounds)
        scrollView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        self.addSubview(scrollView)
        
        return scrollView
    }()
    
    public func addView(view: UIView) {
        let width = self.bounds.width
        let height = self.bounds.height
        
        view.frame = CGRectMake(width * CGFloat(self.views.count), 0, width, height)
        view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.scrollView.addSubview(view)
        self.views.append(view)
        self.scrollView.contentSize = CGSizeMake(width * CGFloat(self.views.count), height)
    }
    
    // MARK: UIScrollView Delegate
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let offset = scrollView.contentOffset.x
        let nextIndex = (offset - self.beginOffset) > 0.0 ? self.currentIndex + 1 : self.currentIndex - 1
        
        var destView : UIView?
        if nextIndex >= 0 && nextIndex < self.views.count {
            destView = self.views[nextIndex]
        }
        
        if let animator = self.animator {
            let percent : CGFloat = min(1.0, fabs((offset - self.beginOffset) / pageWidth))
            let sourceView = self.views[self.currentIndex]
            let direction : SlideDirection = (offset - self.beginOffset > 0.0) ? .right : .left
            animator.update(sourceView, destinationView: destView, withpercent: percent, direction: direction)
        }
    }
    
    public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.beginOffset = scrollView.contentOffset.x
        
        let pageWidth = scrollView.frame.size.width
        let offset = scrollView.contentOffset.x
        let diff = floor(offset - pageWidth / CGFloat(self.views.count))
        
        self.currentIndex = Int(floor(diff / pageWidth)) + 1
    }
}
