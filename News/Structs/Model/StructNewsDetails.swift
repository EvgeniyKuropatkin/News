//
//  StructNewsDetails.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

struct StructNewsDetail: Codable , Identifiable{
    let date: String
    let fullDescription: String
    let id: Int
    let shortDescription: String
    let title: String
}

struct StructNewsDetails: Codable {
    let code: Int
    let news: StructNewsDetail
}
