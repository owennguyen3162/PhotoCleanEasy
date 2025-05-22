//
//  CircularProcessView.swift
//  PhotoCleanEasy
//
//  Created by Nguyen Anh Tuan on 22/5/25.
//

import UIKit

class CircularProcessView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var duration: TimeInterval = 1.0
    private var progressLayer: CAShapeLayer = CAShapeLayer()
    private var trackLayer: CAShapeLayer = CAShapeLayer()
    var radiusValue: CGFloat = 2.0
    var value: Float = 0.0
    
    private func initUI() {
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createCirclePath()
    }
    
    private func createCirclePath() {
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: (frame.size.width * 1 - 1.5) / radiusValue,
            startAngle: CGFloat(-0.5 * Double.pi),
            endAngle: CGFloat(1.5 * Double.pi),
            clockwise: true
        )
        
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor(hex: "#3C3C3C").cgColor
        trackLayer.lineWidth = 9.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor(hex: "#FB5C5B").cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 9.0
        
        layer.addSublayer(progressLayer)
        
        
        setProgressWithAnimation(duration: duration, fromValue: 0, value: 0.5)
        
    }

    func setProgressWithAnimation(duration: TimeInterval, fromValue: Float, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.add(animation, forKey: "animateCircle")
    }
    
}
