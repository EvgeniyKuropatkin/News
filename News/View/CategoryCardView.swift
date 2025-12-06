//
//  CategoryCardView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI
///Структура представления карточки категории
struct CategoryCardView: View {
    ///Переменная для хранения данных о категории
    let categoryCard: StructCategoryList
    
    var body: some View {
        VStack{
            Text(categoryCard.name)
                .font(.largeTitle)
                .padding()
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Image("NewsBackground")
                .resizable()
                .cornerRadius(20)
                .opacity(0.3)
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
