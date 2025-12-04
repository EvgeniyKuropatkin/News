//
//  NewsCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct NewsCardView: View {
    
    let NewsCard: StructNewslist
    
    var body: some View {
        ZStack{
            
            Image("NewsBackground")
                .frame(width: 370, height: 300)
                .cornerRadius(30)
                .opacity(0.3)
                .padding(5)
            
            VStack{
                Text(NewsCard.title)
                    .frame(width: 350)
                    .font(.title)
                    .padding(5)
                    .lineLimit(3)
                
                Text(NewsCard.shortDescription)
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
        NewsCard: StructNewslist(id: 0,
                             title: "Парочка туристов случайно воспользовалась «личным самолетом»",
                             date : "2016-08-20T11:15:21.104Z",
                                 shortDescription: "Семейная пара из Великобритании ощутила прелести полета на личном самолете, оказавшись единственными пассажирами на обычном пассажирском рейсе.")
        )
}
