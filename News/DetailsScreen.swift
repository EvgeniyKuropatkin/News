//
//  DetailsScreen.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import SwiftUI

struct DetailsScreen: View{
    
    let id: Int
    
    ///Переменная для хранения извлеченных данных
    @State var itemsDetail : StructNewsDetail? =  nil
    
    ///Переменная для обозначения загрузки
    @State private var isLoading = false
    
    
    private func loadDetails(id: Any){
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                itemsDetail = try await NetworkManager.shared.getDetails(id: id as! Int).news
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
                .cornerRadius(20)
                .opacity(0.3)
                .padding(5)
                
                VStack{
                    Text(itemsDetail?.title ?? "")
                        .font(.title)
                        .padding()
                    
                    Text(itemsDetail?.shortDescription ?? "")
                        .padding()
                    ScrollView(.vertical, showsIndicators: false){
                        Text(itemsDetail?.fullDescription ?? "")
                            .font(.title)
                            .padding(5)
                    }
                }
            }
            .onAppear {
                loadDetails(id: id)
            }
        }
        
    }
}


#Preview {
    DetailsScreen(id: 11)
}
