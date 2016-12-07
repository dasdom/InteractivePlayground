//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class ViewController: UIViewController {
  
  var allButtons: [UIButton]?
  
  override func viewDidLoad() {
    view.backgroundColor = UIColor.white
    view.tintColor = UIColor.white
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show/Hide", style: .plain, target: self, action: #selector(ViewController.animate))
  }
  
  func animate() {
    if let allButtons = allButtons {
      hide(buttons: allButtons)
    } else {
      showButtons()
    }
  }
  
  func showButtons() {
    let makeButtonWithTitle = { (title: String) -> UIButton in
      let button = UIButton(type: .system)
      button.backgroundColor = UIColor.brown
      button.setTitle(title, for: .normal)
      button.layer.cornerRadius = 5
      return button
    }
    
    let aButton = makeButtonWithTitle("Option a")
    let bButton = makeButtonWithTitle("Option b")
    let cButton = makeButtonWithTitle("Option c")
    
    allButtons = [aButton, bButton, cButton]
    
    guard let allButtons = allButtons else { fatalError() }
    
    for button in allButtons.reversed() {
      button.frame = CGRect(x: 10, y: -40, width: view.frame.size.width-20, height: 40)
      view.addSubview(button)
    }
    
    for (index, button) in allButtons.enumerated() {
      
      UIView.animate(withDuration: 0.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: [], animations: {
        
        button.frame.origin.y = 60 + CGFloat(index) * (button.frame.size.height + 10)
      }) { (_) in
        
      }
    }
  }
  
  func hide(buttons: [UIButton]) {
    for button in buttons {
      UIView.animate(withDuration: 0.5, animations: {
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
navigationController.navigationBar.barTintColor = UIColor.white

PlaygroundPage.current.liveView = navigationController.view

//: [Next](@next)
