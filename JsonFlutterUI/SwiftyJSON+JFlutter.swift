//
//  SwiftyJSON+JFlutterUI.swift
//  JsonFlutterUI
//
//  Created by KoingDev on 9/5/20.
//  Copyright © 2020 koing.dev. All rights reserved.
//

import SwiftyJSON

extension JSON {
    
    static var empty: JSON {
        JSON()
    }
    
    static func json(fromFileName fileName: String) -> JSON {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let jsonString = try? String(contentsOfFile: path),
            !jsonString.isEmpty else { return JSON.empty }
        
        return JSON(parseJSON: jsonString)
    }
    
    var json: JSON? {
        exists() ? self : nil
    }
    
//    var columnMainAxisAlignment: UIStackView.Alignment {
//        let value = self["mainAxisAlignment"].stringValue
//        switch value {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
}
