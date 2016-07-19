//
//  ViewController.swift
//  RollingBall
//
//  Created by HuuLuong on 7/19/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ball = UIImageView()
    var ballRadius = CGFloat()
    var radians = CGFloat()
    var deltaAngle = CGFloat()
    var moveX = CGFloat()
    var moveY = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ballRadius = 32
        deltaAngle = 0.1
        moveX = ballRadius * deltaAngle
        moveY = ballRadius * deltaAngle
        
        addBackGround()
        addBall()
        
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBackGround() -> Void {
        let background = UIImageView(image: UIImage(named: "grass_yard.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview((background))
    }
    
    func addBall(){
        
        let mainViewSize = self.view.bounds.size
       
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame = CGRect(x: ballRadius, y: mainViewSize.height, width: ballRadius*2, height: ballRadius*2)
        ball.center = CGPointMake(mainViewSize.width * 0.5, mainViewSize.height * 0.5)
        
        self.view.addSubview(ball)
    }
    
    func rollBall() -> Void {
        
      
        if (ball.center.x + ballRadius >= self.view.bounds.size.width) || (ball.center.x - ballRadius <= 0) {
            radians = 0
            deltaAngle = -deltaAngle
            moveX = -moveX
        }
        if (ball.center.y + ballRadius >= self.view.bounds.size.height) || (ball.center.y - ballRadius <= 0) {
            radians = 0
            deltaAngle = -deltaAngle
            moveY = -moveY
        }
        
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
        ball.center = CGPointMake(ball.center.x + moveX, ball.center.y + moveY)
        
        
    }


}

