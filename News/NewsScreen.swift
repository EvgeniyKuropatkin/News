//
//  NewsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import SwiftUI

struct NewsScreen: View{
    
     let id: Int
    
    @State private var page: Int = 0
    
    @EnvironmentObject var envNews: EnvNews
    
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Image("NewsBackground")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFill()
                
                ScrollView(.vertical){
                    ForEach(envNews.itemsNews){news in
                        NavigationLink(destination: {DetailsScreen(id: news.id)},
                                       label:{NewsCardView(NewsCard: news)}
                        )
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
                .scrollPosition(id: $envNews.activeNewsID, anchor: .bottomTrailing)
                .onChange(of: envNews.activeNewsID, {oldValue, newValue in
                    if newValue == envNews.lastNewsID {
                        page += 1
                        envNews.loadNews(id: id, page: page)
                    }
                })
                .onAppear {
                    envNews.loadNews(id: id, page: page)
                }
                .onDisappear{
                    envNews.itemsNews = []
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
}


#Preview {
    NewsScreen(id: 0)
}

