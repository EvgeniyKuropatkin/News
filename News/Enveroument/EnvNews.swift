//
//  EnvNews.swift
//  News
//
//  Created by 1111 on 05.12.2025.
//

import Foundation
import SwiftUI
import Combine
///Класс подписанный на протокол ObservableObject для использования наблюдаемых объектов и быстрой передачи данных разным View
final class EnvNews: ObservableObject {
    ///Переменная для хранения извлеченных данных о категории новостей
    @Published var itemsCategory = [StructCategoryList]()
    ///Переменная для обозначения загрузки
    @Published var isLoading = false
    ///Переменная для хранения извлеченных данных о новости
    @Published var itemsNews = [StructNewslist]()
    ///Переменная для обозначения наличия новостей на странице
    @Published var isNews = false
    ///Переменная для хранения последней отображаемой страницы
    @Published var lastFetchedPage = -1
    ///Переменная для хранения актуальной отображаемой новости на странице
    @Published var activeNewsID: Int?
    ///Переменная для хранения последней отображаемой новости на странице
    @Published var lastNewsID: Int?
    ///Переменная для хранения извлеченных детальных данных новости
    @Published var itemsDetail : StructNewsDetail? =  nil
    
    ///Функция для извлечения данных о категории из API
    func loadCategory(){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                itemsCategory = try await NetworkManager.shared.getCategory().list
                isLoading = false
            } catch {
                print("Ошибка: \(error)")
                isLoading = false
            }
        }
    }
    
    ///Функция для извлечения данных о новости из API
    func loadNews(id: Int, page: Int ){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let News:[StructNewslist] = try await NetworkManager.shared.getNews(id: id, page: page).list
                
                if !News.isEmpty && !itemsNews.starts(with: News){
                    itemsNews.append(contentsOf: News)
                    lastNewsID = itemsNews.last?.id
                    lastFetchedPage = page
                }
                isLoading = false
                if News.isEmpty && itemsNews.isEmpty{
                    isNews = true
                }
            }
            
            catch {
                print("Ошибка: \(error)")
                self.isLoading = false
                
            }
        }
    }
    
    ///Функция для извлечения детальных данных о новости из API
    func loadDetails(id: Int){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                itemsDetail = try await NetworkManager.shared.getDetails(id: id).news
                isLoading = false
            } catch {
                print("Ошибка: \(error)")
                isLoading = false
            }
        }
    }
}
