//: [Previous](@previous)

import UIKit
import XCPlayground

class View: UIView {
  let titleTextField: UITextField
  let titleLabel: UILabel
  let button: UIButton
  
  override init(frame: CGRect) {
    titleTextField = UITextField()
    titleTextField.placeholder = "Title"
    titleTextField.backgroundColor = UIColor(white: 0.98, alpha: 1.0)

    titleLabel = UILabel()
    titleLabel.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
    titleLabel.text = " "
    
    button = UIButton(type: .System)
    button.setTitle("Set Text", forState: .Normal)
    button.addTarget(nil, action: "setText", forControlEvents: .TouchUpInside)
    
    super.init(frame: frame)
    
    backgroundColor = UIColor.whiteColor()

    let stackView = UIStackView(arrangedSubviews: [titleTextField, titleLabel, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .Vertical
    stackView.distribution = .EqualSpacing
    stackView.spacing = 10
    
    addSubview(stackView)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-20-[stackView]-20-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[stackView]", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

class ViewController: UIViewController {
  
  var contentView: View { return view as! View }
  
  override func loadView() {
    view = View()
  }
  
  func setText() {
    contentView.titleLabel.text = contentView.titleTextField.text
  }
}

let viewController = ViewController()
viewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 400)

XCPlaygroundPage.currentPage.liveView = viewController.view

//: [Next](@next)
