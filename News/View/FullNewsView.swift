//
//  FullNewsView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct FullNewsView: View {
    
    let FullNews: FullNewsStruct
    
    var body: some View {
        ZStack{
            Image(FullNews.image)
                .resizable()
                .cornerRadius(20)
                .opacity(0.3)
                .padding()
            
            VStack{
                Text(FullNews.title)
                    .font(.title)
                    .padding()
                
                Text(FullNews.ShortDiscription)
                    .padding()
                ScrollView(.vertical, showsIndicators: false){
                    Text(FullNews.FullDiscription)
                        .font(.title)
                        .padding(5)
                }
            }
        }
    }
}

#Preview {
    FullNewsView(
        FullNews:FullNewsStruct(
            title: "Название новости",
            ShortDiscription: "краткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новости",
            FullDiscription: "полное описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новостикраткое описание новости.frame(width: 300).frame(width: 300).frame(width: 300).frame(width: 300).frame(width: 300).frame(width: 300)",
            date: "12.12.2025",
            category:"Crime",
            image: "Crime"
        )
    )
}
