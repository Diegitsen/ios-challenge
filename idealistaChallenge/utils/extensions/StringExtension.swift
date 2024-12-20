//
//  StringExtension.swift
//  idealistaChallenge
//
//  Created by diegitsen on 20/12/24.
//

import Foundation

extension String {
    func localize() -> String {
       
        if let preferedLanguage = UserDefaults.standard.string(forKey: "preferedLanguage") {
            let path = Bundle.main.path(forResource: preferedLanguage, ofType: "lproj")
            let bundle = Bundle(path: path!)
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        } else {
            return NSLocalizedString(self, comment: "")
        }
    }
}
