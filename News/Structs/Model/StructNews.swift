//
//  StructNews.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

///Структура для данных о новости
struct StructNewslist : Codable, Identifiable, Equatable{

    ///Идентификационный номер
    let id: Int

    ///Название новости
    let title: String

    ///Дата публикации новости
    let date: String

    ///Краткое сожержание новости
    let shortDescription: String
}

///Структура для новости
struct StructNews: Codable {

    ///Код
    let code: Int

    ///Список данных о новости
    let list: [StructNewslist]
}
