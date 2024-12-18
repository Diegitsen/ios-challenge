//
//  DateExtensions.swift
//  idealistaChallenge
//
//  Created by diegitsen on 18/12/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.init(identifier: "es")
        
        return dateFormatter.string(from: self)
    }
    
    func toStringDetailed() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.init(identifier: "es")
        
        return dateFormatter.string(from: self)
    }

}
