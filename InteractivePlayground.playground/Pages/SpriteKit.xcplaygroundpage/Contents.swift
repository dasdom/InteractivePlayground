//: [Previous](@previous)

import UIKit
import SpriteKit
import PlaygroundSupport

class Scene: SKScene {
  
  override init(size: CGSize) {
    super.init(size: size)
    
    physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    if let touch = touches.first {
      
      let sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width: 30, height: 30))
      
      let physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
      //      physicsBody.restitution = 0.5
      sprite.physicsBody = physicsBody
      
      addChild(sprite)
      sprite.position = touch.location(in: self)
    }
  }
  
}

let skView = SKView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
skView.showsNodeCount = true
skView.showsFPS = true
let scene = Scene(size: CGSize(width: 300, height: 400))

skView.presentScene(scene)

PlaygroundPage.current.liveView = skView

//: [Next](@next)
