//
//  ViewController.swift
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/12/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

import UIKit
import NativeNavigation


class ViewController: UIViewController {
    
    var mMessage:String! = "hello from swift!"
    var msg:UITextField? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Integration Demo"
        print("here");
        
        let pushButton1 = UIButton(type: .roundedRect)
        pushButton1.setTitle("Push message to React Native", for: .normal)
        pushButton1.addTarget(self, action: #selector(pushScreenOne(sender:)), for: .touchUpInside)
        pushButton1.frame = CGRect(x: 0, y: 140, width: 320, height: 60)
        pushButton1.center.x = self.view.center.x
        view.addSubview(pushButton1)
        
        msg = UITextField(frame: CGRect(x: 20, y: 100, width: 320, height: 60))
        msg?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        mMessage = UserDefaults.standard.string(forKey: "currentMessage")!
        if(mMessage != nil && !(mMessage.isEmpty)){
            print ("nonempty")
            msg?.text = mMessage
        }else{
            msg?.text = "hello from swift!"
        }
        

        msg?.frame = CGRect(x: 0, y: 100, width: 320, height: 40)
        msg?.textAlignment = .center
        msg?.borderStyle = UITextBorderStyle.roundedRect
        msg?.center.x = self.view.center.x
        view.addSubview(msg!)

        
        let pushButton2 = UIButton(type: .roundedRect)
        pushButton2.setTitle("Push TabScreen", for: .normal)
        pushButton2.addTarget(self, action: #selector(pushTabScreen(sender:)), for: .touchUpInside)
        pushButton2.frame = CGRect(x: 0, y: 190, width: 320, height: 60)
        pushButton2.center.x = self.view.center.x
        view.addSubview(pushButton2)
        
        view.backgroundColor = .white


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
        
        if(msg != nil){
            print ("not nil")
            
            mMessage = UserDefaults.standard.string(forKey: "currentMessage")!
            if(mMessage != nil && !(mMessage.isEmpty)){
                print ("nonempty")
                msg?.text = mMessage
            }else{
                msg?.text = "hello from swift!"
            }

            
        }
        else{
            print("nil")
        }
        
        
        
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        UserDefaults.standard.set(textField.text, forKey: "currentMessage")
        mMessage = UserDefaults.standard.string(forKey: "currentMessage")!
    }
    
    func pushScreenOne(sender: UIButton) {
        let screenOne = ReactViewController(moduleName: "RNStuff", props: ["message": mMessage as AnyObject])
        navigationController?.pushReactViewController(screenOne, animated: true)
        
        
    }
    
    func pushTabScreen(sender: UIButton) {
        let tabScreen = ReactTabBarController(moduleName: "TabScreen")
        self.presentReactViewController(tabScreen, animated: true, completion: nil)
    }


//

}

