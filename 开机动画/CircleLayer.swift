//
//  CircleLayer.swift
//  开机动画
//
//  Created by 聚石慧 on 16/6/20.
//  Copyright © 2016年 开机动画. All rights reserved.
//

import UIKit

class CircleLayer: CAShapeLayer {

    let KAnimationDuring = 0.3
    let KAnimationBeginTime = 0.0
    
    override init() {
        super.init()
        self.fillColor = UIColor.colorWithHexString("#da70d6").CGColor
        self.path = circleSmallPath.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var circleSmallPath: UIBezierPath{
        return UIBezierPath.init(ovalInRect: CGRectMake(50, 50, 0, 0))
    }
    var circleBigPath: UIBezierPath{
        return UIBezierPath.init(ovalInRect: CGRectMake(2.5, 17.5, 95, 95))
    }
    var circleVerticalSquishPath: UIBezierPath{
        return UIBezierPath.init(ovalInRect: CGRectMake(2.5, 20, 95, 90))
    }
    var circleHorizontalSquishPath: UIBezierPath{
        return UIBezierPath.init(ovalInRect: CGRectMake(5, 20, 90, 90))
    }
    
    func myAnimation() {
        
        let animation1: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        animation1.fromValue = circleBigPath.CGPath
        animation1.toValue   = circleVerticalSquishPath.CGPath
        animation1.beginTime = KAnimationBeginTime
        animation1.duration = KAnimationDuring
        
        let animation2: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        animation2.fromValue = circleVerticalSquishPath.CGPath
        animation2.toValue   = circleHorizontalSquishPath.CGPath
        animation2.beginTime = animation1.beginTime + animation1.duration
        animation2.duration = KAnimationDuring
        
        let animation3: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        animation3.fromValue = circleHorizontalSquishPath.CGPath
        animation3.toValue   = circleVerticalSquishPath.CGPath
        animation3.beginTime = animation2.beginTime + animation2.duration
        animation3.duration = KAnimationDuring
        
        let animation4: CABasicAnimation = CABasicAnimation.init(keyPath: "path")
        animation4.fromValue = circleVerticalSquishPath.CGPath
        animation4.toValue   = circleBigPath.CGPath
        animation4.beginTime = animation3.beginTime + animation3.duration
        animation4.duration = KAnimationDuring
        
        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = [animation1,animation2,animation3,animation4]
        animationGroup.duration = 4*KAnimationDuring
        animationGroup.repeatCount = 2
        addAnimation(animationGroup, forKey: nil)
        
    }
    /**
     expand animation function
     */
    func expand() {
        let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = circleSmallPath.CGPath
        expandAnimation.toValue = circleBigPath.CGPath
        expandAnimation.duration = KAnimationDuring
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        self.addAnimation(expandAnimation, forKey: nil)
    }
    
    /**
     contract animation function
     */
    func contract() {
        let contractAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        contractAnimation.fromValue = circleBigPath.CGPath
        contractAnimation.toValue = circleSmallPath.CGPath
        contractAnimation.duration = KAnimationDuring
        contractAnimation.fillMode = kCAFillModeForwards
        contractAnimation.removedOnCompletion = false
        addAnimation(contractAnimation, forKey: nil)
    }
}
