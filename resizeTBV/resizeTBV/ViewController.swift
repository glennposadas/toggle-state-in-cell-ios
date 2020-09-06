//
//  ViewController.swift
//  resizeTBV
//
//  Created by Glenn Von Posadas on 9/6/20.
//  Copyright © 2020 Outliant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var isShown = [(TableViewCell, Bool)]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
    cell.tableView = tableView
    
    if self.isShown.isEmpty {
      self.isShown = [(cell, false)]
    }
    
    cell.isShown = self.isShown.first!.1
    cell.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
}

// MARK: -

extension ViewController: CellDelegate {
  func didUpdateState(cell: TableViewCell, state: Bool) {
    self.isShown = [(cell, state)]
  }
}
