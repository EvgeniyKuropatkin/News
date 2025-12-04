//
//  StructCategory.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation

struct StructCategoryList: Codable, Identifiable{
    let id: Int
    let name: String
}

struct StructCategory: Codable{
    let code: Int
    let list: [StructCategoryList]
}
