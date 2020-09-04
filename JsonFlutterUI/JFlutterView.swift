//
//  JFlutterView.swift
//  JsonFlutterUI
//
//  Created by KoingDev on 9/5/20.
//  Copyright © 2020 koing.dev. All rights reserved.
//

import UIKit
import SwiftyJSON

protocol JFlutterView: UIView {
    var layout: JSON { get }
    
    func setState(json: JSON)
    func didLayout()
}
protocol JFlutterViewWithData: JFlutterView {
    var data: JSON { get }
}


////////////////////////////////////////////////////////////////
//MARK: - Parser
////////////////////////////////////////////////////////////////

class JFlutterViewParser {
    
    enum JFlutterComponent: String {
        case none
        case label
        case view
        case textField
        case flatButton
        case outlineButton
        case row
        case column
        case stack
    }
    
    static func view(fromJSON json: JSON) -> JFlutterView {
        let view: JFlutterView
        let type = JFlutterComponent.init(rawValue: json["type"].stringValue) ?? .none
        switch type {
        case .label:
            view = JFlutterLabel(json: json)
        case .column:
            view = JFlutterColumn(json: json)
        default:
            view = JFlutterLabel(json: json)
        }
        return view
    }
    
}


////////////////////////////////////////////////////////////////
//MARK: - Components
////////////////////////////////////////////////////////////////

class JFlutterColumn: UIStackView, JFlutterView {
    
    var layout: JSON
    
    // MARK: - JFlutter
    func setState(json: JSON) {
        
    }
    
    func didLayout() {
        
    }
    
    // MARK: - Init
    init(json: JSON) {
        layout = json
        super.init(frame: .zero)
        
        
        // TODO
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 400).isActive = true
        heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        
        // Layout
        if let childrenJSON = json["children"].array {

//            json["mainAxisAlignment"].
            
            
            // Add childrens
            let views = childrenJSON.map { JFlutterViewParser.view(fromJSON: $0) }
            views.forEach {
                addArrangedSubview($0)
                $0.didLayout()
            }

        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class JFlutterLabel: UILabel, JFlutterViewWithData {
    
    var data: JSON = JSON()
    var layout: JSON
    
    // MARK: - JFlutter
    func setState(json: JSON) {
        
    }
    
    func didLayout() {
        
    }
    
    // MARK: - Init
    init(json: JSON) {
        layout = json
        super.init(frame: .zero)
        
        // Layout
        json["text"].string.map { self.text = $0 }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
