//: [Previous](@previous)

import UIKit
import XCPlayground

class ViewController: UIViewController {
  
  var allButtons: [UIButton]?
  
  override func viewDidLoad() {
    view.backgroundColor = .whiteColor()
    view.tintColor = UIColor.whiteColor()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show/Hide", style: .Plain, target: self, action: "animate")
  }
  
  func animate() {
    if let allButtons = allButtons {
      hideButtons(allButtons)
    } else {
      showButtons()
    }
  }
  
  func showButtons() {
    let makeButtonWithTitle = { (title: String) -> UIButton in
      let button = UIButton(type: .System)
      button.backgroundColor = .brownColor()
      button.setTitle(title, forState: .Normal)
      button.layer.cornerRadius = 5
      return button
    }
    
    let aButton = makeButtonWithTitle("Option a")
    let bButton = makeButtonWithTitle("Option b")
    let cButton = makeButtonWithTitle("Option c")
    
    allButtons = [aButton, bButton, cButton]
    
    guard let allButtons = allButtons else { fatalError() }
    
    for button in allButtons.reverse() {
      button.frame = CGRect(x: 10, y: -40, width: view.frame.size.width-20, height: 40)
      view.addSubview(button)
    }
    
    for (index, button) in allButtons.enumerate() {
      
      UIView.animateWithDuration(0.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
        
        button.frame.origin.y = 60 + CGFloat(index) * (button.frame.size.height + 10)
      }) { (_) in
        
      }
    }
  }
  
  func hideButtons(buttons: [UIButton]) {
    for button in buttons {
      UIView.animateWithDuration(0.5, animations: {
        button.frame.origin.y = -40
        button.alpha = 0
        }, completion: { (_) in
          button.removeFromSuperview()
      })
    }
    self.allButtons = nil
  }
}

let navigationController = UINavigationController(rootViewController: ViewController())

navigationController.view.frame.size = CGSize(width: 320, height: 400)
navigationController.navigationBar.barTintColor = .whiteColor()

XCPlaygroundPage.currentPage.liveView = navigationController.view

//: [Next](@next)
