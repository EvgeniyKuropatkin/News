//
//  CategoryCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct CategoryCardView: View {
    
    let categoryCard:CategoryCardStruct
    
    var body: some View {
        ZStack{
            Image(categoryCard.image)
                .frame(width: 300, height: 100)
                .cornerRadius(20)
                .opacity(0.4)
                .padding()
            
            VStack{
                Text(categoryCard.category)
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

#Preview {
    CategoryCardView(
        categoryCard: CategoryCardStruct(
            category:"Crime",
            image: "Crime"
        )
    )
}
