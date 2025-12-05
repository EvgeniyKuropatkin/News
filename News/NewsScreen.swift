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
    @State private var page: Int = 0
    ///Переменная для обозначения загрузки
    @State private var isLoading = false
    @State private var lastFetchedPage = -1
    
    @State private var activeNewsID: Int?
    
    @State private var lastNewsID: Int?
    
    
    
    func loadNews(id: Int, page: Int ){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                print("id \(id), page \(page)")
                let News = try await NetworkManager.shared.getNews(id: id, page: page).list
                
                await MainActor.run {
                    if News.isEmpty{
                        self.page = lastFetchedPage
                    }
                    else{
                        self.itemsNews.append(contentsOf: News)
                        lastNewsID = self.itemsNews.last?.id
                        lastFetchedPage = page
                    }
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
                
                ScrollView(.vertical){
                    ForEach(itemsNews){news in
                        NavigationLink(destination: {DetailsScreen(id: news.id)},
                                       label:{NewsCardView(NewsCard: news)}
                        )
                    }
                    .overlay(alignment: .bottom){
                        if isLoading{
                            ProgressView()
                                .offset(y:30)
                        }
                    }
                    .padding()
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $activeNewsID, anchor: .bottomTrailing)
                .onChange(of: activeNewsID, {oldValue, newValue in
                    if newValue == lastNewsID ?? -1{
                        page += 1
                        loadNews(id: id, page: page)
                    }
                })
                .onAppear {
                    if itemsNews.isEmpty{ loadNews(id: id, page: page)}
                }
            }
        }
    }
}


#Preview {
    NewsScreen(id: 0)
}

