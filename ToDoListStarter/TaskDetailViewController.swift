//
//  TaskDetailViewController.swift
//  ToDoListStarter
//
//  Created by Rafael González on 14/12/22.
//

import UIKit

class TaskDetailViewController: UITableViewController {

    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskDate: UIDatePicker!
    @IBOutlet var taskNotes: UITextView!
    @IBOutlet var taskCancelButton: UIBarButtonItem!
    @IBOutlet var taskSaveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func taskCancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        let isModal = self.presentingViewController is UINavigationController
        if isModal{
            self.dismiss(animated: true)
        }
        else{
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
