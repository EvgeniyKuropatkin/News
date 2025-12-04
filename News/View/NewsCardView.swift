//
//  NewsCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct NewsCardView: View {
    
    let NewsCard: FullNewsStruct
    
    var body: some View {
        ZStack{
            
            Image(NewsCard.image)
                .frame(width: 300, height: 150)
                .cornerRadius(20)
                .opacity(0.3)
                .padding(5)
            
            VStack{
                Text(NewsCard.title)
                    .font(.title)
                    .padding(5)
                
                Text(NewsCard.ShortDiscription)
                    .frame(width: 300)
                    .padding(5)
                    .lineLimit(3)
                
                Text(NewsCard.date)
                    .padding(5)
            }
        }
    }
}

#Preview {
    NewsCardView(
        NewsCard: FullNewsStruct(
            title: "Название новости",
            ShortDiscription: "краткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новости",
            FullDiscription: "полное описание новости",
            date: "12.12.2025",
            category:"Crime",
            image: "Crime"
        )
    )
}
