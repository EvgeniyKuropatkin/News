//
//  ContentView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI
///Экран для показа категорий
struct CategoryScreen: View {

    @EnvironmentObject var envNews: EnvNews
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false){
                ForEach(envNews.itemsCategory){category in
                    NavigationLink(
                        destination: { NewsScreen(id: category.id) },
                        label: { CategoryCardView(categoryCard: category) }
                    )
                    .padding(5)
                    
                }
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background{
                Image("NewsBackground")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .opacity(0.2)
            }
            
            .onAppear {
                envNews.loadCategory()
                envNews.itemsNews = []
            }
        }
    }
}

#Preview {
    CategoryScreen()
        .environmentObject(EnvNews())
}
