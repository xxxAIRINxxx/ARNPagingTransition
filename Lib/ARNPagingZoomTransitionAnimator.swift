//
//  ARNPagingZoomTransitionAnimator.swift
//  ARNPagingTransition
//
//  Created by xxxAIRINxxx on 2015/01/11.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit

public class ARNPagingZoomTransitionAnimator: NSObject, ARNPagingTransitionAnimator {
    
    public var zoom : CGFloat = 0.88
    public var finalAlpha : CGFloat = 0.6
    
    public func update(sourceView: UIView, destinationView: UIView?, withpercent: CGFloat, direction: SlideDirection) {
        let sourceViewZoom = 1.0 - CGFloat(1.0 - self.zoom) * withpercent
        sourceView.transform = CGAffineTransformMakeScale(sourceViewZoom, sourceViewZoom)
        
        if let destView = destinationView {
            let destViewZoom = self.zoom + (1.0 - self.zoom) * withpercent
            destView.transform = CGAffineTransformMakeScale(destViewZoom, destViewZoom)
            destView.alpha = self.finalAlpha + (1.0 - self.finalAlpha) * withpercent
        }
    }
}
