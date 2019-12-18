//
//  ViewController.swift
//  fire_JsON
//
//  Created by pop on 12/9/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet weak var emailtx: UITextField!
    @IBOutlet weak var passtx: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginbutton(_ sender: Any) {
        guard let email = emailtx.text , !email.isEmpty else{return}
        guard let pass = passtx.text, !pass.isEmpty else{return}
        api.login(email: email, pass: pass) { (error: Error?, suc: Bool) in
            if suc {
                print("login done")
            }else{print("login failed")}
        }
    
        
    }
        
}
    


