//
//  StructNews.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

struct StructNewslist : Codable, Identifiable{
    let id: Int
    let title: String
    let date: String
    let shortDescription: String
}

struct StructNews: Codable {
    let code: Int
    let list: [StructNewslist]
}
