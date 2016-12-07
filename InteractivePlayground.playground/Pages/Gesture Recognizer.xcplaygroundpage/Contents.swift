//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class View: UIView {
  
  let label: UILabel
  
  override init(frame: CGRect) {
    
    label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 20)
    label.text = "Do something"
    label.numberOfLines = 0
    label.textAlignment = .center
    
    super.init(frame: frame)
    
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(sender:))))
    
    let leftSwipeRecogniser = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
    leftSwipeRecogniser.direction = UISwipeGestureRecognizerDirection.left
    addGestureRecognizer(leftSwipeRecogniser)
   
    let rightSwipeRecogniser = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
    rightSwipeRecogniser.direction = UISwipeGestureRecognizerDirection.right
    addGestureRecognizer(rightSwipeRecogniser)
    
    let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(sender:)))
    panRecognizer.require(toFail: leftSwipeRecogniser)
    panRecognizer.require(toFail: rightSwipeRecogniser)
    addGestureRecognizer(panRecognizer)
    
    backgroundColor = UIColor.white
    
    addSubview(label)
    
    label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func tap(sender: UITapGestureRecognizer) {
    label.text = "tap"
  }
  
  func swipe(sender: UISwipeGestureRecognizer) {
    let directionString: String
    switch sender.direction {
    case UISwipeGestureRecognizerDirection.left:
      directionString = "left"
    case UISwipeGestureRecognizerDirection.up:
      directionString = "up"
    case UISwipeGestureRecognizerDirection.right:
      directionString = "right"
    case UISwipeGestureRecognizerDirection.down:
      directionString = "down"
    default:
      directionString = "w00t?"
    }
    
    label.text = "swipe \(directionString)"
  }
  
  func pan(sender: UIPanGestureRecognizer) {
    label.text = "pan with velocity:\nx: \(sender.velocity(in: self).x)\ny: \(sender.velocity(in: self).y)"
  }
  
}

let view = View(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

PlaygroundPage.current.liveView = view

//: [Next](@next)
