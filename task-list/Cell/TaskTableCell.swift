//
//  TaskTableCell.swift
//  task-list
//
//  Created by Оксана Зверева on 16.08.2020.
//  Copyright © 2020 Oksana Zvereva. All rights reserved.
//

import UIKit

class TaskTableCell: UITableViewCell {
    
    @IBOutlet weak private var nameLabel: UILabel!
    
    @IBOutlet weak private var countLabel: UILabel!
    
    func configureCell (name: String, count: String  ) {
           nameLabel.text = name
           countLabel.text = count
       }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           
           // Configure the view for the selected state
       }
    

       
}
