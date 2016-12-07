//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class View: UIView {
  
  let textField: UITextField
  let label: UILabel
  
  override init(frame: CGRect) {
    
    textField = UITextField()
    textField.backgroundColor = UIColor.yellow
    textField.placeholder = "Type something"
    
    label = UILabel()
    label.backgroundColor = UIColor.black
    label.textColor = UIColor.white
    label.text = " "
    
    let button = UIButton(type: .system)
    button.setTitle("I'm a button!", for: .normal)
    button.tintColor = UIColor.white
    
    let stackView = UIStackView(arrangedSubviews: [textField, label, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 10
    
    super.init(frame: frame)
    
    backgroundColor = UIColor.brown
    
    addSubview(stackView)
    button.addTarget(self, action: #selector(View.changeLabelText), for: .touchUpInside)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[stackView]", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activate(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func changeLabelText() {
    label.text = textField.text
  }
}

let hostView = View(frame: CGRect(x: 0, y: 0, width: 320, height: 200))

PlaygroundPage.current.liveView = hostView

//: [Next](@next)
