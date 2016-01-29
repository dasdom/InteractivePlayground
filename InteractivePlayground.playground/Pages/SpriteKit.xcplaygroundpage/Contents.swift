//: [Previous](@previous)

import UIKit
import SpriteKit
import XCPlayground

class Scene: SKScene {
  
  override init(size: CGSize) {
    super.init(size: size)
    
    physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if let touch = touches.first {
      
      let sprite = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 30, height: 30))
      
      let physicsBody = SKPhysicsBody(rectangleOfSize: sprite.size)
//      physicsBody.restitution = 0.5
      sprite.physicsBody = physicsBody
      
      addChild(sprite)
      sprite.position = touch.locationInNode(self)
    }
  }
}

let skView = SKView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
skView.showsNodeCount = true
skView.showsFPS = true
let scene = Scene(size: CGSize(width: 300, height: 400))

skView.presentScene(scene)

XCPlaygroundPage.currentPage.liveView = skView

//: [Next](@next)
