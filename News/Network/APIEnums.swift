//
//  APIEnums.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

enum NetworkError: String, Error{
    
    /// Неверный URL
    case invalidURL = "InvalidURL"
    
    ///Невалидный ответ
    case invalidResponse = "InvalidResponse"
    
    ///Невалидные данные
    case invadidData = "InvalidData"
}
