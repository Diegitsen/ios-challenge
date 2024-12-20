//
//  PropertyType.swift
//  idealistaChallenge
//
//  Created by diegitsen on 19/12/24.
//

import Foundation

enum PropertyType: String {
    case flat = "flat"
    case house = "homes"
    case unknown = "unknown"
    
    var name: String {
        switch self {
        case .flat:
            return "Piso"
        case .house:
            return "Casa"
        case .unknown:
            return "-"
        }
    }
}
