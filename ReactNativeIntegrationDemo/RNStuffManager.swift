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
class RNStuffManager: RCTEventEmitter {
    
    //var bridge: RCTBridge!
    
    @objc func dismissPresentedViewController(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let presentedViewController: UIViewController! = view.reactViewController()
                presentedViewController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func save(_ reactTag: NSNumber, message: NSString) -> Void {
        // Save message
        UserDefaults.standard.set(message, forKey: "currentMessage")
        print("new identifier: " + (message as String))
        dismissPresentedViewController(reactTag)
        
        self.sendEvent(
            withName: "TextEvent",
            body: ["name": "Text Event save succesfully received on native side", "message": message])
        
        
    }
    
    @objc func addEvent(_ reactTag: NSNumber, message:NSString, callback successCallback: RCTResponseSenderBlock) -> Void {
        // Date is ready to use!
        NSLog("Bridge: %@", self.bridge);
        //NSLog("%@ %@ %@", name, location, date)
        var ret = [[String:Any]]()
        ret.append([ "status": "success"])
        successCallback(ret)
        self.bridge.eventDispatcher().sendAppEvent(withName: "EventReminder", body: ret)
    }
    
    override func supportedEvents() -> [String]! {
        return ["TextEvent", "EventReminder"]
    }
    
}
