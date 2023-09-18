//
//  TaskViewModel.swift
//  ToDo
//
//  Created by Owen Medina on 9/17/23.
//
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func addTask(_ task: Task) {
            tasks.append(task)
    }
    
    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
}
