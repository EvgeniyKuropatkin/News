//
//  StructNewsDetails.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

///Структура для деталей о новости
struct StructNewsDetail: Codable , Identifiable{

    ///Дата публикации новости
    let date: String

    ///Полное описание новости
    let fullDescription: String

    ///Идентификационный номер
    let id: Int

    ///Краткое описание новости
    let shortDescription: String

    ///Название новости
    let title: String
}

///Структура для детальных новости
struct StructNewsDetails: Codable {

    ///Код
    let code: Int

    ///Структура получения  детальных данных о новости
    let news: StructNewsDetail
}
