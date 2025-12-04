//
//  FullNewsStruct.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import Foundation

///Структура карточки новости
struct FullNewsStruct: Hashable, Identifiable{
    ///Идентификационный номер
    let id = UUID()
    ///Название новости
    let title: String
    ///краткое описание новости
    let ShortDiscription: String
    ///полное описание новости
    let FullDiscription: String
    ///Дата
    let date: String
    ///Категория новости
    let category: String
    ///Сопровождающая картинка
    let image: String
}
