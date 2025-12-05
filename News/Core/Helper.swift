//
//  Helper.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

public func formatDate(dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        let udate = outputFormatter.string(from: date)
        return udate
    }
    return "—"
}
