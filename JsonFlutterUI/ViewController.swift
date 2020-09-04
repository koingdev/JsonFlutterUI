//
//  ViewController.swift
//  JsonFlutterUI
//
//  Created by KoingDev on 9/5/20.
//  Copyright © 2020 koing.dev. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    let json = JSON.json(fromFileName: "layout")
    
    override func loadView() {
        super.loadView()
        view.addSubview(JFlutterViewParser.view(fromJSON: json))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

