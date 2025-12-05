//
//  ContentView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct CategoryScreen: View {
    
    @EnvironmentObject var envNews: EnvNews
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("NewsBackground")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFill()
                
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(envNews.itemsCategory){category in
                        NavigationLink(destination: {NewsScreen(id: category.id)},
                                       label:{CategoryCardView(categoryCard: category)}
                        )
                    }
                }
            }
            .onAppear {
                envNews.loadCategory()
            }
        }
    }
}

#Preview {
    CategoryScreen()
        .environmentObject(EnvNews())
}
