//
//  RNStuffReactModule.swift
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/12/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

import Foundation
import React

class RNStuffReactModule: NSObject {
    static let sharedInstance = RNStuffReactModule()
    var bridge: RCTBridge?
    
    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(
            bridge: viewBridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
        return rootView
    }
    
}

extension RNStuffReactModule: RCTBridgeDelegate {
    
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return URL(string: "http://localhost:8081/index.ios.bundle?platform=ios")
    }
}
