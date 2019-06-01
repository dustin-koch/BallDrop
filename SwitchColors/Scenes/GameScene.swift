//
//  GameScene.swift
//  SwitchColors
//
//  Created by Dustin Koch on 6/1/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //MARK: - Properties
    var colorSwitch = SKSpriteNode()
    

    override func didMove(to view: SKView) {
        layoutScene()
        setupPhysics()
        spawnBall()
    }
    
    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.5)
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width / 3 , height: frame.size.width / 3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.midY - colorSwitch.size.height)
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width / 2)
        colorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorSwitch.physicsBody?.isDynamic = false
        
        addChild(colorSwitch)
    }

    func spawnBall() {
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.size = CGSize(width: 30.0, height: 30.0)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        
        
        addChild(ball)
    }
    
    
    
}//END OF CLASS
