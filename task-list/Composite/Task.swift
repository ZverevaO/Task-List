//
//  Task.swift
//  task-list
//
//  Created by Оксана Зверева on 16.08.2020.
//  Copyright © 2020 Oksana Zvereva. All rights reserved.
//

import Foundation

class Task: TaskProtocol {
    
    var name: String
    var description: String
    var subTask: [Task] = []
    
    init (name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    func addSubTask(task: Task) {
        
        self.subTask.append(task)
    }
    
    func countSubTask() -> String {
        return "\(subTask.count)"
    }
    
}
