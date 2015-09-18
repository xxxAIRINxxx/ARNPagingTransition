//
//  ARNPagingCoverflowTransitionAnimator.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2015/01/11.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit

public class ARNPagingCoverflowTransitionAnimator: NSObject, ARNPagingTransitionAnimator {
    
    public var finalAngel : CGFloat = 30.0
    public var finalAlpha : CGFloat = 0.6
    public var perspective : CGFloat { return 1.0 / -600 }
    
    public func update(sourceView: UIView, destinationView: UIView?, withpercent: CGFloat, direction: SlideDirection) {
        self.transform(sourceView, isDestinationView: false, withpercent: withpercent, direction: direction)
        
        if let destView = destinationView {
            self.transform(destView, isDestinationView: true, withpercent: withpercent, direction: direction)
        }
    }
    
    public func transform(view: UIView, isDestinationView: Bool, withpercent: CGFloat, direction: SlideDirection) {
        var transform = CATransform3DIdentity
        transform.m34 = self.perspective
        
        var angle : CGFloat = 0.0
        if isDestinationView == true {
            angle = -self.finalAngel * CGFloat(M_PI) / 180.0 * (1.0 - withpercent)
        } else {
            angle = self.finalAngel * CGFloat(M_PI) / 180.0 * withpercent
        }
        if direction == .left {
            angle = -angle
        }
        
        transform = CATransform3DRotate(transform, angle, 0.0, 1.0, 0.0)
        view.layer.transform = transform
        if isDestinationView == true {
            view.alpha = finalAlpha + (1.0 - self.finalAlpha) * withpercent
        } else {
            view.alpha = 1.0 - withpercent * (1.0 - self.finalAlpha)
        }
    }
}