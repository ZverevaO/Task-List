//
//  MainTableViewController.swift
//  task-list
//
//  Created by Оксана Зверева on 15.08.2020.
//  Copyright © 2020 Oksana Zvereva. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var myTask = [Task]()
    
    
    @IBAction func tappedAddBtn(_ sender: UIBarButtonItem) {
        showAddTaskForm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Task list"
        
        tableView.register(UINib(nibName: "TaskTableCell", bundle: nil), forCellReuseIdentifier: "TaskTableCell")
        
        tableView.estimatedRowHeight = 100.0
        
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myTask.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableCell", for: indexPath) as! TaskTableCell
        
        let task = myTask[indexPath.row]

        cell.configureCell(name: task.name,  count: "0")

        return cell
    }
    
    func showAddTaskForm ()  {
        
        let alertController = UIAlertController(title: "Add task", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
        })
        
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
        })
        
        let confirmAction = UIAlertAction(title: "Add", style: .default) { [weak self] action in
            guard let name = alertController.textFields?[0].text, let description = alertController.textFields?[1].text else { return }
            let newTask = Task(name: name, description: description)
            self?.myTask.append(newTask)
            self?.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true  )
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSubTask", let cell = sender as? UITableViewCell {
            let crtl = segue.destination as! SubTaskTableViewController
            if let indexPath = tableView.indexPath(for: cell) {
                crtl.configureController(task: myTask[indexPath.row])
            }
        }
    }

}
