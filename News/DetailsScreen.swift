//
//  DetailsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import SwiftUI

struct DetailsScreen: View{
    
    let id: Int
    
    @EnvironmentObject var envNews: EnvNews
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Image("NewsBackground")
                    .resizable()
                .cornerRadius(20)
                .opacity(0.3)
                .padding(5)
                
                VStack{
                    Text(envNews.itemsDetail?.title ?? "")
                        .font(.title)
                        .padding()
                    
                    Text(envNews.itemsDetail?.shortDescription ?? "")
                        .padding()
                    ScrollView(.vertical, showsIndicators: false){
                        Text(envNews.itemsDetail?.fullDescription ?? "")
                            .font(.title)
                            .padding(5)
                    }
                }
            }
            .onAppear {
                envNews.loadDetails(id: id)
            }
        }
        
    }
}


#Preview {
    DetailsScreen(id: 11)
}
