//
//  register.swift
//  fire_JsON
//
//  Created by pop on 12/10/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class register: UIViewController {

    
    @IBOutlet weak var nametf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passagaintf: UITextField!
    @IBOutlet weak var passtf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registbtn(_ sender: Any) {
        guard let name = nametf.text?.trimmed, !name.isEmpty,
            let email = emailtf.text?.trimmed , !email.isEmpty,
        let pass = passtf.text, !pass.isEmpty,
            let pass2 = passagaintf.text ,!pass2.isEmpty
        else{return}
        api.register(name: name, email: email, pass: pass) { (error : Error? ,succes: Bool) in
            if succes{
                print("register done")
            }else {}
            
        }
    }
    
  

}
