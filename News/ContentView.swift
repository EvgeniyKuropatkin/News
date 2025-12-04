//
//  ContentView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    
    private var categoryCard: [CategoryCardStruct] = [CategoryCardStruct(category:"Криминал",image: "Crime"),
                                                      CategoryCardStruct(category:"Политика",image: "Politic"),
                                                      CategoryCardStruct(category:"Экономика",image: "Economy"),
                                                      CategoryCardStruct(category:"Спорт",image: "Sport"),
                                                      CategoryCardStruct(category:"Наука",image: "Science"),]
    
    private var news: [FullNewsStruct] = [FullNewsStruct(title: "Название новости",
                                                         ShortDiscription: "краткое описание новости",
                                                         FullDiscription: "полное описание новости",
                                                         date: "12.12.2025",
                                                         category:"Crime",
                                                         image: "Crime"),
                                          FullNewsStruct(title: "Название новости",
                                                           ShortDiscription: "краткое описание новости",
                                                           FullDiscription: "полное описание новости",
                                                           date: "12.12.2025",
                                                           category:"Crime",
                                                           image: "Crime")]
    
    var body: some View {

        NavigationView {
            
            ZStack{
                
                Image("NewsBackground")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFill()
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    ForEach(categoryCard){card in
                        
                        NavigationLink(destination:
                                        ScrollView(.vertical, showsIndicators: false){
                                            ForEach(news){new in
                                                NavigationLink(destination:FullNewsView(FullNews: new)){
                                                    NewsCardView(NewsCard: new)
                                                }
                                                }
                                            }
                                        )
                        {
                            CategoryCardView(categoryCard: card)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
