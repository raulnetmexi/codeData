//
//  ToDoListViewController.swift
//  ToDoListStarter
//
//  Created by Rafael González on 14/12/22.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var toDoListTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoListTable.delegate = self
        toDoListTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
