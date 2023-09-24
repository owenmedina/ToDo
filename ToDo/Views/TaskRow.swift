//
//  TaskRow.swift
//  ToDo
//
//  Created by Owen Medina on 9/17/23.
//

import SwiftUI

struct TaskRow: View {
    @Binding var isCompleted: Bool
    var task: Task

    var body: some View {
        NavigationLink(destination: TaskDetailPage(task: task)) {
            HStack {
                Image(systemName: isCompleted ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        toggleTaskCompletion()
                    }
                    .foregroundColor(isCompleted ? .green : .primary)
                
                Text(task.name)
                    .strikethrough(isCompleted)
                    .foregroundColor(isCompleted ? .gray : .primary)
            }
        }

    }
    
    private func toggleTaskCompletion() {
        isCompleted.toggle()
    }
}


struct TaskRow_Previews: PreviewProvider {
    @State static private var isCompleted = false
    
    static var previews: some View {
        TaskRow(isCompleted: Binding<Bool>(
            get: { isCompleted },
            set: { newValue in isCompleted = newValue }
        ), task: Task(name: "Sample Task"))
    }
}
