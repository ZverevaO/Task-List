//
//  TaskProtocol.swift
//  task-list
//
//  Created by Оксана Зверева on 16.08.2020.
//  Copyright © 2020 Oksana Zvereva. All rights reserved.
//

import Foundation

protocol TaskProtocol {
    var name: String { get }
    var description: String { get }
    func addSubTask (task: Task)
    
    func countSubTask () -> String
}


