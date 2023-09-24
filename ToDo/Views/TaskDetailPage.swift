//
//  TaskDetailPage.swift
//  ToDo
//
//  Created by Owen Medina on 9/17/23.
//

import SwiftUI

struct TaskDetailPage: View {
    let task: Task
    
    var body: some View {
        List {
            // For each TODO figure out how to iterate through the fields of an object
        }
        .listStyle(GroupedListStyle()) // Use a grouped list style for better spacing
        .navigationTitle(task.name)
    }
}

struct TaskDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTask = Task(name: "Sample Task") // Provide a default task for the preview
        return NavigationView {
            TaskDetailPage(task: sampleTask)
        }
    }
}
