//
//  TableViewCell.swift
//  resizeTBV
//
//  Created by Glenn Von Posadas on 9/6/20.
//  Copyright © 2020 Outliant. All rights reserved.
//

import UIKit

protocol CellDelegate: class {
  func didUpdateState(cell: TableViewCell, state: Bool)
}

class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var btn: UIButton!
  @IBOutlet weak var textView: UITextView!
  var stringIfHidden = "Ok back to hidden!~~~"
  var stringIfShown = "Itidaki masuuuuuu!!! fjawkfjwakfj fajwfilhweaffj3h3 fkjehjfgh ersjfgrdjksghjrsghsjkghasejkghaejkghaejkghaejkgherajksghrjksfgvmndfdfnxfxbfvfxbbvmfxbvjfjxjvfjxhnvjfjxjvfjvfxvfxjvfjx kfjesakfjak fkwajfkaw This is the last sentence!"
  
  var tableView: UITableView!
  var isShown: Bool = false
  var delegate: CellDelegate?
  
  func setupCell() {
    self.textView.text = self.isShown ? self.stringIfShown : self.stringIfHidden
    self.btn.addTarget(self, action: #selector(toggle), for: .touchUpInside)
  }
  
  @objc func toggle() {
    self.tableView.beginUpdates()
    self.isShown = !self.isShown
    self.delegate?.didUpdateState(cell: self, state: self.isShown)
    
    let value: CGAffineTransform = self.isShown ? CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 2)) : .identity;
    
    UIView.animate(withDuration: 0.3) {
      self.btn.transform = value
    }

    self.textView.text = self.isShown ? self.stringIfShown : self.stringIfHidden
    
    self.tableView.endUpdates()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.setupCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
