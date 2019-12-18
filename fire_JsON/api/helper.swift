//
//  helper.swift
//  fire_JsON
//
//  Created by pop on 12/10/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    class func saveapi(_ token : String){
     let def = UserDefaults.standard
        def.setValue(token, forKey: "api_token")
        def.synchronize()
        restartApp()
    }
    
    
    class func getipToken()->String?{
        let def = UserDefaults.standard
        return def.object(forKey: "api_token") as? String
    }
    
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else{return} // keyWindow each app has 1 window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc : UIViewController
        if getipToken() == nil {
            vc = sb.instantiateInitialViewController()!
        }else{
            vc = sb.instantiateViewController(withIdentifier: "main")
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
}

















