//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by David on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    weak var delegate: ButtonTableViewCellDelegate?
    
    
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    fileprivate func updateButton(_ isComplete: Bool) {
             let imageName = isComplete ? "complete" : "incomplete"
             completeButton.setImage(UIImage(named: imageName), for: .normal)
         }
    
    func update(withTask task: Task) {
           taskNameLabel.text = task.name
           dueDateLabel.text = "Task is due on: \(task.due!.formatted)"
           updateButton(task.isComplete)
       }
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
 }
}
