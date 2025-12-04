//
//  CategoryCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct CategoryCardView: View {
    
    let categoryCard: StructCategoryList
    
    var body: some View {
        ZStack{
            
            Image("NewsBackground")
            .frame(width: 350, height: 100)
            .cornerRadius(20)
            .opacity(0.3)
            .padding(5)
            
            VStack{
                Text(categoryCard.name)
                    .font(.largeTitle)
                    .bold()
            }
        }
    }
}

#Preview {
    CategoryCardView(
        categoryCard: StructCategoryList(
            id: 0, name: "Много новостей"
        )
    )
}
