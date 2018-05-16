//
//  RadialView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialView: BaseFrameView {
    
    var rings = [CAShapeLayer]()
    
    override internal func setUp() {
        setUpRings()
        setUpAnimations()
        setUpDashes()
    }
    
    private func complexSpin(_ circle:CAShapeLayer) {
        let animation = CircleSpinAnimate(circle)
        animation.complex()
    }
    
    private func spin(_ circle:CAShapeLayer) {
        let animation = CircleSpinAnimate(circle)
        animation.rotate()
    }
    
    private func setUpRings() {
        setUpRing(0)
        setUpRing(1)
        setUpRing(2)
    }
    
    private func setUpAnimations() {
        spin(rings[1])
        complexSpin(rings[2])
    }
    
    private func setUpDashes() {
        rings[1].lineDashPattern = [1.0]
    }
    
    private func setUpRing(_ index:Int) {
        let ring = createCircle()
        ring.path = createPath(ring, index)
        layer.addSublayer(ring)
        rings.insert(ring, at: index)
    }
    
    private func createCircle()->CAShapeLayer {
        let circle = CAShapeLayer()
        circle.frame = layer.bounds
        circle.fillColor = nil
        circle.strokeColor = lineColor
        circle.lineWidth = CGFloat(lineWidth)
        
        return circle
    }
    
    private func createPath(_ circle:CAShapeLayer,_ index:Int)->CGPath {
        let startAngel = -(Double.pi/2)
        let endAngel = startAngel + (Double.pi * 2)
        let circleWidth = circle.bounds.size.width
        
        return UIBezierPath(
            arcCenter: circle.position,
            radius: radius(index, width: circleWidth),
            startAngle: CGFloat(startAngel),
            endAngle: CGFloat(endAngel),
            clockwise: true
            ).cgPath
    }
    
    private func radius(_ index:Int, width:CGFloat)->CGFloat {
        var baseRad = Int(width)/2
        let reduction = (Int(lineWidth) * index) + (2 * index)
        baseRad -= reduction
        return CGFloat(baseRad)
    }

}
