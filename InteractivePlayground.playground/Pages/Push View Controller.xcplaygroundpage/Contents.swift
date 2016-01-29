//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class TableViewController: UITableViewController {
  
  override func viewDidLoad() {
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    
    cell.textLabel?.text = "Row: \(indexPath.row)"
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let next = TableViewController()
    next.title = "Row: \(indexPath.row)"
    navigationController?.pushViewController(next, animated: true)
    
    print(navigationController?.viewControllers.count)
  }
}

let tableViewController = TableViewController()
tableViewController.title = "start"
let navigationController = UINavigationController(rootViewController: tableViewController)

navigationController.view.frame.size = CGSize(width: 320, height: 400)
navigationController.navigationBar.barTintColor = .whiteColor()

XCPlaygroundPage.currentPage.liveView = navigationController.view

