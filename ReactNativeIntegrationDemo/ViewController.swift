//
//  ViewController.swift
//  ReactNativeIntegrationDemo
//
//  Created by Harshul Mulchandani on 3/12/17.
//  Copyright © 2017 Harshul Mulchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var msg: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let message = UserDefaults.standard.string(forKey: "currentMessage")
        msg.text = message
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reactNativeViewController = segue.destination as! ReactNativeViewController
        reactNativeViewController.msg = msg.text
    }
//

}

