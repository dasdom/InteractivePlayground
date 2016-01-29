//: [Previous](@previous)

import UIKit
import XCPlayground

class View: UIView {
  
  let label: UILabel
  
  override init(frame: CGRect) {
    
    label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFontOfSize(20)
    label.text = "Do something"
    label.numberOfLines = 0
    label.textAlignment = .Center
    
    super.init(frame: frame)
    
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tap:"))
    
    let leftSwipeRecogniser = UISwipeGestureRecognizer(target: self, action: "swipe:")
    leftSwipeRecogniser.direction = UISwipeGestureRecognizerDirection.Left
    addGestureRecognizer(leftSwipeRecogniser)
   
    let rightSwipeRecogniser = UISwipeGestureRecognizer(target: self, action: "swipe:")
    rightSwipeRecogniser.direction = UISwipeGestureRecognizerDirection.Right
    addGestureRecognizer(rightSwipeRecogniser)
    
    let panRecognizer = UIPanGestureRecognizer(target: self, action: "pan:")
    panRecognizer.requireGestureRecognizerToFail(leftSwipeRecogniser)
    panRecognizer.requireGestureRecognizerToFail(rightSwipeRecogniser)
    addGestureRecognizer(panRecognizer)
    
    backgroundColor = UIColor.whiteColor()
    
    addSubview(label)
    
    label.leadingAnchor.constraintEqualToAnchor(leadingAnchor).active = true
    label.trailingAnchor.constraintEqualToAnchor(trailingAnchor).active = true
    label.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
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
    case UISwipeGestureRecognizerDirection.Left:
      directionString = "left"
    case UISwipeGestureRecognizerDirection.Up:
      directionString = "up"
    case UISwipeGestureRecognizerDirection.Right:
      directionString = "right"
    case UISwipeGestureRecognizerDirection.Down:
      directionString = "down"
    default:
      directionString = "w00t?"
    }
    
    label.text = "swipe \(directionString)"
  }
  
  func pan(sender: UIPanGestureRecognizer) {
    label.text = "pan with velocity:\nx: \(sender.velocityInView(self).x)\ny: \(sender.velocityInView(self).y)"
  }
  
}

let view = View(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

XCPlaygroundPage.currentPage.liveView = view

//: [Next](@next)
