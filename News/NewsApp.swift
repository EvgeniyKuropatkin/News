//
//  NewsApp.swift
//  News
//
//  Created by 1111 on 20.11.2025.
//

import SwiftUI

@main
struct NewsApp: App {
    
    @StateObject var envNews = EnvNews()
    
    var body: some Scene {
        WindowGroup {
            CategoryScreen()
                .environmentObject(envNews)
        }
    }
}
