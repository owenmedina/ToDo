//
//  Task.swift
//  ToDo
//
//  Created by Owen Medina on 9/16/23.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var isCompleted: Bool = false
    var tags: [String] = []
    var effort: Int?
}
