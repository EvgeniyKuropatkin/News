//
//  NewsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import SwiftUI

struct NewsScreen: View{
    
     let id: Int
    
    ///Переменная для хранения извлеченных данных
    @State private var itemsNews = [StructNewslist]()
    
    ///Переменная для обозначения загрузки
    @State private var isLoading = false
    
    private func loadNews(id: Int){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                itemsNews = try await NetworkManager.shared.getNews(id: id).list
                await MainActor.run {
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    print("Ошибка: \(error)")
                    self.isLoading = false
                }
            }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Image("NewsBackground")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFill()
                
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(itemsNews){news in
                        NavigationLink(destination: {DetailsScreen(id: news.id)},
                                       label:{NewsCardView(NewsCard: news)}
                        )
                    }
                }
            }
            .onAppear {
                loadNews(id: id)
            }
        }
        
    }
}


#Preview {
    NewsScreen(id: 0)
}

