//
//  NewsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import SwiftUI
///Экран для показа списка новостей выбранной категории
struct NewsScreen: View{
    ///Идентификационный номер по которому обращаемся к подробностям
     let id: Int
    ///Номер страницы
    @State private var page: Int = 0
    
    @EnvironmentObject var envNews: EnvNews
    ///Переменная для закрытия экрана показа новостей и перехода к экрану выбору категорий
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                    ForEach(envNews.itemsNews){news in
                        NavigationLink(
                            destination: { DetailsScreen(id: news.id) },
                            label: { NewsCardView(NewsCard: news) }
                        )
                        .padding()
                    }
                
                    .overlay(alignment: .bottom){
                        if envNews.isLoading{
                            ProgressView()
                                .offset(y:30)
                        }
                    }
                    .padding()
                    .scrollTargetLayout()
                }
            
                .background{
                    Image("NewsBackground")
                        .resizable()
                        .opacity(0.2)
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            
                .scrollPosition(
                    id: $envNews.activeNewsID,
                    anchor: .bottomTrailing
                )
            
                .onChange(
                    of: envNews.activeNewsID, {
                        oldValue, newValue in
                        if newValue == envNews.lastNewsID {
                            page += 1
                            envNews.loadNews(id: id, page: page)
                        }
                    }
                )
            
                .onAppear {
                    envNews.loadNews(id: id, page: page)
                }
            }
        
            .alert(
                "Новостей нет!",
                isPresented: $envNews.isNews
            ) {
                Button() {
                    dismiss()
                } label: {
                    Text("Перейти к выбору категорий")
                }
            } message: {
                Text("Зайдите позже")
            }
        
    }
}


#Preview {
    NewsScreen(id: 0)
        .environmentObject(EnvNews())
}

