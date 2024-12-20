//
//  PropertyOperation.swift
//  idealistaChallenge
//
//  Created by diegitsen on 19/12/24.
//

import Foundation
import UIKit

enum PropertyOperation: String {
    case rent = "rent"
    case sale = "sale"
    case unknown = "-"
    
    var color: UIColor {
        switch self {
        case .rent:
            return UIColor.greenPerformance
        case .sale:
            return UIColor.blue
        case .unknown:
            return UIColor.black
        }
    }
    
    var name: String {
        switch self {
        case .rent:
            return "Renta"
        case .sale:
            return "Venta"
        case .unknown:
            return "-"
        }
    }
}
