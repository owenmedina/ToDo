//
//  ContentView.swift
//  ToDo
//
//  Created by Owen Medina on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTask: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        let task = tasks[index]
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                .onTapGesture {
                                    toggleTaskCompletion(index: index)
                                }
                                .foregroundColor(task.isCompleted ? .green : .primary)

                            Text(task.name)
                                .strikethrough(task.isCompleted)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete(perform: deleteTask)
                }

                HStack {
                    TextField("Enter a new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: addTask) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationTitle("To-Do List")
        }
    }

    func addTask() {
        if !newTask.isEmpty {
            tasks.append(Task(name: newTask))
            newTask = ""
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func toggleTaskCompletion(index: Int) {
        tasks[index].isCompleted.toggle()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

