//: [Previous](@previous)

import UIKit
import PlaygroundSupport

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
      label.textAlignment = .center
      
      let stackView = UIStackView(arrangedSubviews: [label, slider])
      stackView.axis = .vertical
      stackView.alignment = .fill
      return (label, slider, stackView)
    }
    
    var durationStackView: UIStackView = UIStackView()
    (durationLabel, durationSlider, durationStackView) = makeStackView("Duration", 0.1, 10)
    
    var dampingStackView: UIStackView = UIStackView()
    (dampingLabel, dampingSlider, dampingStackView) = makeStackView("Damping", 0.1, 1)
    
    var velocityStackView: UIStackView = UIStackView()
    (initialVelocityLabel, initialVelocitySlider, velocityStackView) = makeStackView("Initial Velocity", 0, 5)
    
    let button = UIButton()
    button.setTitle("Animate", for: .normal)
    button.backgroundColor = UIColor.blue
    
    let stackView = UIStackView(arrangedSubviews: [durationStackView, dampingStackView, velocityStackView, button])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 30
    
    redBox = UIView(frame: CGRect(x: 50, y: 20, width: 30, height: 30))
    redBox.backgroundColor = UIColor.red
    
    super.init(frame: frame)
    
    backgroundColor = UIColor.white
    
    addSubview(redBox)
    addSubview(stackView)
    
    durationSlider.addTarget(self, action: #selector(changeDuration(sender:)), for: .valueChanged)
    dampingSlider.addTarget(self, action: #selector(changeDamping(sender:)), for: .valueChanged)
    initialVelocitySlider.addTarget(self, action: #selector(changeVelocity(sender:)), for: .valueChanged)
    button.addTarget(self, action: #selector(View.animate as (View) -> () -> ()), for: .touchUpInside)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "|-[stackView]-|", options: [], metrics: nil, views: views)
    layoutConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[stackView]", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activate(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func animate() {
    UIView.animate(withDuration: Double(durationSlider.value), delay: 0.0, usingSpringWithDamping:CGFloat(dampingSlider.value), initialSpringVelocity: CGFloat(initialVelocitySlider.value), options: [], animations: {
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

PlaygroundPage.current.liveView = view

//: [Next](@next)
