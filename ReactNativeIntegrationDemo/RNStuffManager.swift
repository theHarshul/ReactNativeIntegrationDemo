//
//  RNStuffManager.swift
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/13/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

import Foundation
import React

@objc(RNStuffManager)
class RNStuffManager: NSObject {
    
    var bridge: RCTBridge!
    
    @objc func dismissPresentedViewController(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let presentedViewController: UIViewController! = view.reactViewController()
                presentedViewController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func save(_ reactTag: NSNumber, message: NSString, forIdentifier identifier: NSString) -> Void {
        // Save message
        UserDefaults.standard.set(message, forKey: "currentMessage")
        print("new identifier: " + (identifier as String))
        dismissPresentedViewController(reactTag)
        
        /*self.sendInputEvent(
         withName: "RNManagerEvent",
         body: ["name": "event", "message": identifier, "extra": identifier])*/
        
    }
    
    //    override func  -> [String]! {
    //        return ["RNManagerEvent"]
    //    }
}
