//
//  NetworkManager.swift
//  News
//
//  Created by 1111 on 21.11.2025.
//

import Foundation
///Класс для работы с API
final class NetworkManager {
    ///Общедоступный экземпляр `NetworkManager`
    static let shared = NetworkManager()
    ///Декодер JSON
    let decoder = JSONDecoder()
    /// Приватный инициализатор, предотвращающий создание дополнительных экземпляров.
    private init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    ///Функция получения данных для категорий
    func getCategory() async throws -> StructCategory{
        
        let urlCategory: String = "https://testtask.sebbia.com/v1/news/categories"
        
        guard let url = URL(string: urlCategory) else {throw NetworkError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do{
            return try decoder.decode(StructCategory.self, from: data)
        }
        catch{
            throw NetworkError.invadidData
        }
    }
    ///Функция для получения данных о новости
    func getNews(id: Int, page: Int) async throws -> StructNews{
        
        let urlNews: String = "https://testtask.sebbia.com/v1/news/categories/\(id)/news?page=\(page)"
        
        guard let url = URL(string: urlNews) else {throw NetworkError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do{
            return try decoder.decode(StructNews.self, from: data)
        }
        catch{
            throw NetworkError.invadidData
        }
    }
    ///Функция для получения детальных данных о новости
    func getDetails(id:Int) async throws -> StructNewsDetails{
        
        let urlNewsDetails: String = "https://testtask.sebbia.com/v1/news/details?id=\(id)"
        
        guard let url = URL(string: urlNewsDetails) else {throw NetworkError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw NetworkError.invalidResponse}
        
        do{
            return try decoder.decode(StructNewsDetails.self, from: data)
        }
        catch{
            throw NetworkError.invadidData
        }
    }
    
}
