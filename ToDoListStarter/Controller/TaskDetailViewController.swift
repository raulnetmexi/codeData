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
    //obtengo el contexto a utilizar
    let context = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
    
    // "contenedor" de la tarea a visualizar o registrar
    var toDoDetailTask : Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Verifico si Task existe (recibida para consulta)
        if toDoDetailTask != nil{
            taskTitle.text = toDoDetailTask?.title
            taskDate.date = (toDoDetailTask?.date)!
            taskNotes.text = toDoDetailTask?.notes
        }
        else{
            //creo una instancia de Task
            toDoDetailTask = Task(context: context)
            taskTitle.text = ""
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ToDoListViewController
        
        toDoDetailTask?.title = taskTitle.text
        toDoDetailTask?.date = taskDate.date
        toDoDetailTask?.notes = taskNotes.text
        
        destination.currentTask = toDoDetailTask!
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var perform = false
        if validateText(text: taskTitle.text!){
            perform = true
        }
        else{
            userMessage(alertTitle: "Warning", message: "Title is required", actionTitle: "Ok", vc: self)
        }
        return perform
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
