//
//  DateUtils.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 08.09.2023.
//

import Foundation

class DateUtils {
    static func formatDate(_ dateString: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = inputDateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = outputDateFormatter.string(from: date)
            return formattedDate
        } else {
            return "Ошибка при парсинге даты"
        }
    }
}
