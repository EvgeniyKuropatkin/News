//
//  Helper.swift
//  News
//
//  Created by 1111 on 04.12.2025.
//

import Foundation
import UIKit
import Combine
///Публичная функция для форматирования даты
public func formatDate(dateString: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    if let date = inputFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd.MM.yyyy"
        return outputFormatter.string(from: date)
    }
    return "—"
}

///функция для парсинга html
func convertHtmlToAttributedString(htmlString: String, fontSize: CGFloat = 16) -> AttributedString? {
    guard let data = htmlString.data(using: .utf8) else { return nil }
    
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
        .documentType: NSAttributedString.DocumentType.html,
        .characterEncoding: String.Encoding.utf8.rawValue
    ]
    
    do {
        let mutableAttributedString = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
        
        let newFont = UIFont.systemFont(ofSize: fontSize)
        mutableAttributedString.enumerateAttributes(in: NSRange(location: 0, length: mutableAttributedString.length), options: []) { attrs, range, _ in
            var newAttrs = attrs
            if let font = attrs[.font] as? UIFont {
                let traits = font.fontDescriptor.symbolicTraits
                let descriptor = UIFont.systemFont(ofSize: fontSize).fontDescriptor
                    .withSymbolicTraits(traits) ?? UIFont.systemFont(ofSize: fontSize).fontDescriptor
                newAttrs[.font] = UIFont(descriptor: descriptor, size: fontSize)
            } else {
                newAttrs[.font] = newFont
            }
            mutableAttributedString.setAttributes(newAttrs, range: range)
        }
        
        return try AttributedString(mutableAttributedString, including: \.uiKit)
        
    } catch {
        print("Ошибка парсинга HTML или конвертации: \(error.localizedDescription)")
        return nil
    }
}
