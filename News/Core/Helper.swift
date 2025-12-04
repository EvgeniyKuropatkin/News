//
//  Helper.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

func formatDate(_ dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        return outputFormatter.string(from: date)
    }
    return "—"
}
