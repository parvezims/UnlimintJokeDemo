//
//  Date+Extension.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 15/10/22.
//

import Foundation

extension Date {
    
    func convertLocalDate() -> String {
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateStyle = .medium
        localDateFormatter.timeStyle = .medium
        return localDateFormatter.string(from: self)
    }
}
