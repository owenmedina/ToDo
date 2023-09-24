//
//  TaskFieldRow.swift
//  ToDo
//
//  Created by Owen Medina on 9/23/23.
//

import SwiftUI

struct TaskFieldRow: View {
    var fieldName: String
    var fieldValue: Any?

    var body: some View {
        // TODO fix icon and fieldName not perfectly aligned (fieldName is somehow starting higher)
        HStack(alignment: .top) {
            Image(systemName: iconForFieldName(fieldName))
                .frame(width: 30, height: 30) // Adjust size as needed

            VStack(alignment: .leading) {
                Text(formatFieldName(fieldName))
                    .font(.headline)
                Text(valueForType(fieldValue))
            }
        }
    }
    
    private func iconForFieldName(_ fieldName: String) -> String {
        switch fieldName {
            case "date":
                return "calendar"
            default:
                return "globe" // You can specify a default icon or handle unknown field names here
        }
    }
    
    private func formatFieldName(_ fieldName: String) -> String {
        return fieldName.capitalized
    }
    
    private func valueForType(_ field: Any?) -> String {
        guard let fieldValue = field else {
            return ""
        }
        switch fieldValue {
        case is Int:
                return String(fieldValue as! Int)
        case is String:
            return fieldValue as! String
        case is Date:
                return getStringFromDate(fieldValue as! Date)
            default:
                return "Can't parse data type"
        }
    }
    
    private func getStringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        return dateFormatter.string(from: date)
    }
}

struct TaskFieldRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskFieldRow(fieldName: "date", fieldValue: Date())
    }
}
