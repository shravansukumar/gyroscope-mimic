//
//  PolygonView.swift
//  gyroscope-copy
//
//  Created by Shravan Sukumar on 27/01/18.
//  Copyright © 2018 shravan. All rights reserved.
//

import UIKit

class PolygonView: UIView {

     var sideNumber: Int = 6
     var cornerRadius: CGFloat = 1
     var borderWidth: CGFloat = 1
    var borderColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawShape()
    }
    
    func drawShape() {
        let shapePath = UIBezierPath()
        let theta = CGFloat(2.0 * Double.pi / Double(sideNumber))
        let offset = CGFloat(Float(cornerRadius) * tanf(Float(theta) / 2.0))
        let squareWidth = min(frame.height, frame.width)
        
        var length = squareWidth - CGFloat(borderWidth)
        if sideNumber < 4 {
            length /= 1.5
        }
        let sideLength = length * CGFloat(tanf(Float(theta) / 2.0))
        var point = CGPoint(x: squareWidth / 2.0 + sideLength / 2.0 - offset, y: squareWidth - (squareWidth - length) / 2.0)
        var angle = CGFloat.pi
        shapePath.move(to: point)
        
        for _ in stride(from: 0 as CGFloat, to: sideLength, by: +1 as CGFloat) {
            point = CGPoint(x: CGFloat(point.x) + (sideLength - offset * 2.0) * CGFloat(cosf(Float(angle))), y: CGFloat(point.y) + (sideLength - offset * 2.0) * CGFloat(sinf(Float(angle))))
            shapePath.addLine(to: point)
            let center = CGPoint(x: CGFloat(point.x) + CGFloat(cornerRadius) * CGFloat(cosf(Float(angle) + Float.pi/2)), y: CGFloat(point.y) + CGFloat(cornerRadius) * CGFloat(sinf(Float(angle) + Float.pi)))
            shapePath.addArc(withCenter: center, radius: CGFloat(cornerRadius), startAngle: angle - CGFloat.pi/2, endAngle: angle + theta - CGFloat.pi/2, clockwise: true)
            point = shapePath.currentPoint
            angle += theta
        }
        shapePath.close()
        
        let mask = CAShapeLayer()
        mask.path = shapePath.cgPath
        mask.lineWidth = borderWidth
        mask.strokeColor = UIColor.clear.cgColor
        mask.fillColor = UIColor.white.cgColor
        layer.mask = mask
        
        let border = CAShapeLayer()
        border.path = shapePath.cgPath
        border.lineWidth = borderWidth;
        border.strokeColor = borderColor.cgColor;
        border.fillColor = UIColor.clear.cgColor;
        layer.addSublayer(border)
    }
}
