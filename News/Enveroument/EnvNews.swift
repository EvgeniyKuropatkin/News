//
//  EnvNews.swift
//  News
//
//  Created by 1111 on 05.12.2025.
//

import Foundation
import SwiftUI
import Combine

final class EnvNews: ObservableObject {
    
    ///Переменная для хранения извлеченных данных
    @Published var itemsCategory = [StructCategoryList]()
    ///Переменная для обозначения загрузки
    @Published var isLoading = false
    ///Переменная для хранения извлеченных данных
    @Published var itemsNews = [StructNewslist]()
    
    @Published var isNews = false
    
    @Published var lastFetchedPage = -1
    
    @Published var activeNewsID: Int?
    
    @Published var lastNewsID: Int?
    ///Переменная для хранения извлеченных данных
    @Published var itemsDetail : StructNewsDetail? =  nil

    
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
    
    func loadNews(id: Int, page: Int ){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                print("id \(id), page \(page)")
                let News = try await NetworkManager.shared.getNews(id: id, page: page).list
                
                if !News.isEmpty{
                    itemsNews.append(contentsOf: News)
                    lastNewsID = itemsNews.last?.id
                    lastFetchedPage = page
                }
                isLoading = false
                if News.isEmpty && itemsNews.isEmpty{
                    isNews = true
                    print("isNews \(isNews)")
                }
            }
            
            catch {
                print("Ошибка: \(error)")
                self.isLoading = false
                
            }
        }
    }
    
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
