//: [Previous](@previous)

import UIKit
import XCPlayground

class View: UIView {
  
  let textField: UITextField
  let label: UILabel
  
  override init(frame: CGRect) {
    
    textField = UITextField()
    textField.backgroundColor = UIColor.yellowColor()
    textField.placeholder = "Type something"
    
    label = UILabel()
    label.backgroundColor = UIColor.blackColor()
    label.textColor = UIColor.whiteColor()
    label.text = " "
    
    let button = UIButton(type: .System)
    button.setTitle("I'm a button!", forState: .Normal)
    button.tintColor = UIColor.whiteColor()
    
    let stackView = UIStackView(arrangedSubviews: [textField, label, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .Vertical
    stackView.distribution = .EqualSpacing
    stackView.spacing = 10
    
    super.init(frame: frame)
    
    backgroundColor = UIColor.brownColor()
    
    addSubview(stackView)
    button.addTarget(self, action: "changeLabelText", forControlEvents: .TouchUpInside)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[stackView]", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func changeLabelText() {
    label.text = textField.text
  }
}

let hostView = View(frame: CGRect(x: 0, y: 0, width: 320, height: 200))

XCPlaygroundPage.currentPage.liveView = hostView

//: [Next](@next)
