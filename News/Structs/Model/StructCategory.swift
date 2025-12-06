//
//  StructCategory.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

///Структура для данных о категории
struct StructCategoryList: Codable, Identifiable{
    
    ///Идентификационный номер категории
    let id: Int
    
    ///Название категории
    let name: String
}

///Структура для категорий
struct StructCategory: Codable{
    
    ///Код
    let code: Int
    
    ///Список данных о категории
    let list: [StructCategoryList]
}
