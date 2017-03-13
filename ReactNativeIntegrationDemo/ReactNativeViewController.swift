//
//  ReactNativeViewController.swift
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/12/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

import UIKit
import React

class ReactNativeViewController: UIViewController {
    
    var rnView: RCTRootView!
    var msg: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rnView = RNStuffReactModule.sharedInstance.viewForModule(
            "RNStuff",
            initialProperties: ["identifier": msg, "currentRating": 3])
        self.view.addSubview(rnView)
        
        rnView.frame = self.view.bounds
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

