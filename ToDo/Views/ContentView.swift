//
//  ContentView.swift
//  ToDo
//
//  Created by Owen Medina on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TaskViewModel()
    @State private var newTask: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskRow(isCompleted: $viewModel.tasks[viewModel.tasks.firstIndex(where: { $0.id == task.id })!].isCompleted,
                                task: task)
                    }.onDelete(perform: viewModel.deleteTask)
                }

                HStack {
                    TextField("Enter a new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        viewModel.addTask(Task(name: newTask))
                        newTask = "" // Clear the input field
                    }) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationTitle("To-Do List")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

