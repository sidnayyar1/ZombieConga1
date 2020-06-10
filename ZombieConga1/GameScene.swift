//
//  GameScene.swift
//  ZombieConga1
//
//  Created by Sidharth Nayyar on 6/8/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime: TimeInterval = 0
       var dt: TimeInterval = 0
    let zombieMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    
  override func didMove(to view: SKView) {
    backgroundColor = SKColor.black
    let background = SKSpriteNode(imageNamed: "background1")
    background.position = CGPoint.zero
    background.anchorPoint = CGPoint.zero
    background.zPosition = -1;
    addChild(background)
    zombie.position = CGPoint(x:400,y:400)
    addChild(zombie)
    
    
    
  }
    public struct CGSize {
      public var width: CGFloat
      public var height: CGFloat
      // ...
    }
    
    //update function
    
    override func update(_ currentTime: TimeInterval){
        
        if lastUpdateTime > 0 {
          dt = currentTime - lastUpdateTime
        } else {
        dt = 0 }
        lastUpdateTime = currentTime
         move(sprite: zombie, velocity: velocity)}
    
    //function move
    
    func move(sprite: SKSpriteNode, velocity: CGPoint) {
     
      let amountToMove = CGPoint(x: velocity.x * CGFloat(dt),
                                 y: velocity.y * CGFloat(dt))
      print("Amount to move: \(amountToMove)")
    
      sprite.position = CGPoint(
        x: sprite.position.x + amountToMove.x,
        y: sprite.position.y + amountToMove.y)
    }
    // move zombie toward the points

    func moveZombieToward(location: CGPoint) {
        let offset = CGPoint(x: location.x - zombie.position.x,
    y: location.y - zombie.position.y)
    
        let length = sqrt(
         Double(offset.x * offset.x + offset.y * offset.y))
        
        let direction = CGPoint(x: offset.x / CGFloat(length),
                                y: offset.y / CGFloat(length))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec,
                           y: direction.y * zombieMovePointsPerSec)
    
    }
    //zombie moves on touch
    func sceneTouched(touchLocation:CGPoint) {
      moveZombieToward(location: touchLocation)
    }
    override func touchesBegan(_ touches: Set<UITouch>,
        with event: UIEvent?) {
      guard let touch = touches.first else {
    return
      }
      let touchLocation = touch.location(in: self)
      sceneTouched(touchLocation: touchLocation)
    }
    override func touchesMoved(_ touches: Set<UITouch>,
        with event: UIEvent?) {
      guard let touch = touches.first else {
    return
      }
      let touchLocation = touch.location(in: self)
      sceneTouched(touchLocation: touchLocation)
    }
}
