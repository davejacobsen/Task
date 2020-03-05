//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by David on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    
    var task: Task?
    var dueDateValue: Date?
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }
    
    //Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty else { return }
        let notes = detailTextView.text
        let date = dueDatePicker.date
        if let task = task {
            // update
            TaskController.shared.update(task: task, name: name, notes: notes, due: date)
        } else {
            // create
            TaskController.shared.add(taskWithName: name, notes: notes, due: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.formatted
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        self.taskNameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.detailTextView.resignFirstResponder()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let task = task, isViewLoaded else { return }
        title = task.name
        taskNameTextField.text = task.name
        dueDateTextField.text = (task.due as Date?)?.formatted
        detailTextView.text = task.notes
    }
    
    
    // MARK: - Table view data source
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    
    
    
    
    
    
    
    
    
}
