//: [Previous](@previous)

import UIKit
import XCPlayground

class View: UIView {
  
  let redBox: UIView
  let durationSlider: UISlider
  let durationLabel: UILabel
  let dampingSlider: UISlider
  let dampingLabel: UILabel
  let initialVelocitySlider: UISlider
  let initialVelocityLabel: UILabel
  
  override init(frame: CGRect) {
    
    let makeStackView = { (labelText: String, sliderMin: Float, sliderMax: Float) -> (UILabel, UISlider, UIStackView) in
      let slider = UISlider()
      slider.minimumValue = sliderMin
      slider.maximumValue = sliderMax
      
      let label = UILabel()
      label.text = labelText + ": \(sliderMin)"
      label.textAlignment = .Center
      
      let stackView = UIStackView(arrangedSubviews: [label, slider])
      stackView.axis = .Vertical
      stackView.alignment = .Fill
      return (label, slider, stackView)
    }
    
    var durationStackView: UIStackView = UIStackView()
    (durationLabel, durationSlider, durationStackView) = makeStackView("Duration", 0.1, 10)
    
    var dampingStackView: UIStackView = UIStackView()
    (dampingLabel, dampingSlider, dampingStackView) = makeStackView("Damping", 0.1, 1)
    
    var velocityStackView: UIStackView = UIStackView()
    (initialVelocityLabel, initialVelocitySlider, velocityStackView) = makeStackView("Initial Velocity", 0, 5)
    
    let button = UIButton()
    button.setTitle("Animate", forState: .Normal)
    button.backgroundColor = UIColor.blueColor()
    
    let stackView = UIStackView(arrangedSubviews: [durationStackView, dampingStackView, velocityStackView, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .Vertical
    stackView.spacing = 30
    
    redBox = UIView(frame: CGRect(x: 50, y: 20, width: 30, height: 30))
    redBox.backgroundColor = UIColor.redColor()
    
    super.init(frame: frame)
    
    backgroundColor = UIColor.whiteColor()
    
    addSubview(redBox)
    addSubview(stackView)
    
    durationSlider.addTarget(self, action: "changeDuration:", forControlEvents: .ValueChanged)
    dampingSlider.addTarget(self, action: "changeDamping:", forControlEvents: .ValueChanged)
    initialVelocitySlider.addTarget(self, action: "changeVelocity:", forControlEvents: .ValueChanged)
    button.addTarget(self, action: "animate", forControlEvents: .TouchUpInside)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-80-[stackView]", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func animate() {
    UIView.animateWithDuration(Double(durationSlider.value), delay: 0.0, usingSpringWithDamping:CGFloat(dampingSlider.value), initialSpringVelocity: CGFloat(initialVelocitySlider.value), options: [], animations: {
      if self.redBox.frame.origin.x > 100 {
        self.redBox.frame.origin.x = 50
      } else {
        self.redBox.frame.origin.x = self.frame.width-self.redBox.frame.size.width-50
      }
      }) { (_) in
        
    }
  }
  
  func changeDuration(sender: UISlider) {
    durationLabel.text = "Duration: \(durationSlider.value)"
  }
  
  func changeDamping(sender: UISlider) {
    dampingLabel.text = "Damping: \(dampingSlider.value)"
  }
  
  func changeVelocity(sender: UISlider) {
    initialVelocityLabel.text = "Initial Velocity: \(initialVelocitySlider.value)"
  }
}

let view = View(frame: CGRect(x: 0, y: 0, width: 300, height: 400))

XCPlaygroundPage.currentPage.liveView = view

//: [Next](@next)
