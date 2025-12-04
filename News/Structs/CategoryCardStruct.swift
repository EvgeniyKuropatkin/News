//
//  CategoryCardStruct.swift
//  News
//
//  Created by 1111 on 21.11.2025.
//

import Foundation

///Структура карточки новости
struct CategoryCardStruct: Hashable, Identifiable{
    ///Идентификационный номер
    let id = UUID()
    ///Категория новости
    let category: String
    ///Сопровождающая картинка
    let image: String
}
