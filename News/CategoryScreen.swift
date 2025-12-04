//
//  ContentView.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

struct CategoryScreen: View {
    
    ///Переменная для хранения извлеченных данных
    @State private var itemsCategory = [StructCategoryList]()
    
    ///Переменная для обозначения загрузки
    @State private var isLoading = false
    
    private func loadCategory(){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                itemsCategory = try await NetworkManager.shared.getCategory().list
                await MainActor.run {
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    print("Ошибка: \(error)")
                    self.isLoading = false
                }
            }
        }
    }
    

    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("NewsBackground")
                    .resizable()
                    .opacity(0.2)
                    .scaledToFill()
                
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(itemsCategory){category in
                        NavigationLink(destination: {NewsScreen(id: category.id)},
                                       label:{CategoryCardView(categoryCard: category)}
                        )
                    }
                }
            }
            .onAppear {
                loadCategory()
            }
        }
    }
}

#Preview {
    CategoryScreen()
}
