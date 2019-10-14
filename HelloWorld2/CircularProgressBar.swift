//
//  CircularProgressBar.swift
//  attendance-manager
//
//  Created by Yogesh Manghnani on 02/05/18.
//  Copyright © 2018 Yogesh Manghnani. All rights reserved.
//
import UIKit


class CircularProgressBar: UIView {
    
    var goalName = UILabel()
    var goalProg = UILabel()
    var label1 = UILabel()
    
    
    //MARK: awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        goalName.text = "0"
    }
    
    
    
    //MARK: Public
    
    public var lineWidth:CGFloat = 50 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }
    
    public var labelSize: CGFloat = 25 {
        didSet {
            goalName.font = UIFont.boldSystemFont(ofSize: labelSize)
            goalName.sizeToFit()
            configLabel()
        }
    
    }
    
    public var safePercent: Int = 100 {
        didSet{
            setForegroundLayerColorForSafePercent()
        }
    }
    
    public func setProgress(to progressConstant: Double, withAnimation: Bool) {
        
        var progress: Double {
            get {
                if progressConstant > 1 { return 1 }
                else if progressConstant < 0 { return 0 }
                else { return progressConstant }
            }
        }
        
        foregroundLayer.strokeEnd = CGFloat(progress)
        
        // temporary will get from quiz
        self.goalName.text = "Trip to Paris"
        self.goalProg.text = "$651.50"
        self.label1.text = "saved out of $1303.00"
        self.configLabel()
        
        setupView()
        
    }
    
    
    
    
    //MARK: Private
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var radius: CGFloat {
        get{
            if self.frame.width < self.frame.height { return (self.frame.width - lineWidth)/2 }
            else { return (self.frame.height - lineWidth)/2 }
        }
    }
    
    private var pathCenter: CGPoint{ get{ return self.convert(self.center, from:self.superview) } }
    private func makeBar(){
        self.layer.sublayers = nil
        drawBackgroundLayer()
        drawForegroundLayer()
    }
    
    private func drawBackgroundLayer(){
        let path = UIBezierPath(arcCenter: CGPoint(x:pathCenter.x, y:pathCenter.y), radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        self.backgroundLayer.lineWidth = lineWidth - (lineWidth * 20/100)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.backgroundLayer.strokeColor = UIColor.gray.cgColor
        self.layer.addSublayer(backgroundLayer)
        
    }
    
    private func drawForegroundLayer(){
        
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle
        
        let path = UIBezierPath(arcCenter: CGPoint(x:pathCenter.x, y:pathCenter.y), radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        foregroundLayer.lineCap = CAShapeLayerLineCap.round
        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = #colorLiteral(red: 0.4835554361, green: 0.7841576934, blue: 0.06046832353, alpha: 1)
        
        
        self.layer.addSublayer(foregroundLayer)
        
    }
    
    private func configLabel(){
        goalName.sizeToFit()
        goalName.textColor = #colorLiteral(red: 0, green: 0.3768543005, blue: 0.2880578637, alpha: 1)
        goalName.center = CGPoint(x:pathCenter.x, y:pathCenter.y-40)
        
        goalProg.sizeToFit()
        goalProg.textColor = #colorLiteral(red: 0.4835554361, green: 0.7841576934, blue: 0.06046832353, alpha: 1)
        goalProg.font = UIFont.boldSystemFont(ofSize: 22)
        goalProg.center = CGPoint(x:pathCenter.x, y:pathCenter.y-15)
        
        label1.textColor = UIColor.gray
        label1.sizeToFit()
        label1.center = CGPoint(x:pathCenter.x, y:pathCenter.y+5)
        
    }
    
    private func setForegroundLayerColorForSafePercent(){
        if Int(goalName.text!)! >= self.safePercent {
            self.foregroundLayer.strokeColor = UIColor.green.cgColor
        } else {
            self.foregroundLayer.strokeColor = UIColor.red.cgColor
        }
    }
    
    private func setupView() {
        makeBar()
        self.addSubview(goalName)
        self.addSubview(goalProg)
        self.addSubview(label1)
    }
    
    
    
    //Layout Sublayers
    private var layoutDone = false
    override func layoutSublayers(of layer: CALayer) {
        if !layoutDone {
           // let tempText = goalName.text
            //let temp2 = goalProg.text
            setupView()
            //goalName.text = tempText
            //goalProg.text = temp2
            layoutDone = true
        }
    }
    
}
