//
//  DetailsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation
import SwiftUI
///Экран для показа подробностей о новости
struct DetailsScreen: View{
    ///Идентификационный номер для получения подробностей о новости
    let id: Int
    
    @EnvironmentObject var envNews: EnvNews
    
    var body: some View {
        
        VStack{
            
            Text(envNews.itemsDetail?.title ?? "")
                .font(.title)
                .padding()
            Text(envNews.itemsDetail?.shortDescription ?? "")
                .padding()
            ScrollView(.vertical){
                
                Text(convertHtmlToAttributedString(htmlString: envNews.itemsDetail?.fullDescription ?? "", fontSize: 20) ?? "Не удалось найти подробности о данной новости")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding()
        }
        .background{
            
            Image("NewsBackground")
                .resizable()
                .opacity(0.2)
                .ignoresSafeArea()
        }
        .onAppear {
            
            envNews.loadDetails(id: id)
            
        }
        
        
    }
}

#Preview {
    DetailsScreen(id: 9)
        .environmentObject(EnvNews())
}
