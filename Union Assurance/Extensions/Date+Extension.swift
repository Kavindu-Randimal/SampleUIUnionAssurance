//
//  Date+Extension.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-26.
//

import Foundation

extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
            return dateFormatter.string(from: self)
        }
}
