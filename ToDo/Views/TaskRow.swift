//
//  TaskRow.swift
//  ToDo
//
//  Created by Owen Medina on 9/17/23.
//

import SwiftUI

struct TaskRow: View {
    @Binding var isCompleted: Bool
    var taskName: String

    var body: some View {
        HStack {
            Image(systemName: isCompleted ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    toggleTaskCompletion()
                }
                .foregroundColor(isCompleted ? .green : .primary)

            Text(taskName)
                .strikethrough(isCompleted)
                .foregroundColor(isCompleted ? .gray : .primary)
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
        ), taskName: "Sample Task")
    }
}
