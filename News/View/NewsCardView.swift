//
//  NewsCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI
///Структура представления карточки новости
struct NewsCardView: View {
    ///Переменная для хранения данных о новости
    let NewsCard: StructNewslist
    
    var body: some View {
        
        VStack(spacing: 16){
            Text(NewsCard.title)
                .font(.title)
            
            Text(NewsCard.shortDescription)
            
            Text(formatDate(dateString: NewsCard.date))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background{
            Image("NewsBackground")
                .resizable()
                .cornerRadius(30)
                .opacity(0.3)
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
