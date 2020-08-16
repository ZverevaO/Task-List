//
//  SubTaskTableViewController.swift
//  task-list
//
//  Created by Оксана Зверева on 16.08.2020.
//  Copyright © 2020 Oksana Zvereva. All rights reserved.
//

import UIKit

class SubTaskTableViewController: UITableViewController {
    
    var  subtask: Task?
   // private var subTask: [Task] = []
    
    
    @IBAction func tapAddSubTask(_ sender: UIBarButtonItem) {
        showAddTaskForm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sub task \(subtask?.name)"
        
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
        return subtask?.subTask.count ?? 0
    }
    
    func configureController (task: Task)
    {
        self.subtask = task
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableCell", for: indexPath) as! TaskTableCell
        
        let task = subtask?.subTask[indexPath.row]
        
        cell.configureCell(name: task!.name,  count: "Count subtask: \(task?.subTask.count ?? 0)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           //performSegue(withIdentifier: "toSubTask", sender: tableView.cellForRow(at: indexPath))
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SubTaskTableViewController") as! SubTaskTableViewController
        guard let currentTask = subtask?.subTask[indexPath.row] else {return}
        vc.configureController(task: currentTask)
        
        self.navigationController?.pushViewController(vc, animated: true)
 
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
            self?.subtask?.addSubTask(task: newTask)
            self?.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true  )
    }
    
    

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
