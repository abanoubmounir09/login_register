//
//  api.swift
//  fire_JsON
//
//  Created by pop on 12/10/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class api: NSObject {
    
    let url2 = "http://elzohrytech.com/alamofire_demo/api/v1/"
    class func login(email : String , pass : String , completion:@escaping (_ error: Error? , _ suc : Bool)->Void){
         let url = "http://elzohrytech.com/alamofire_demo/api/v1/login"
         let param = ["email":email,"password":pass]
         Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.default, headers: nil)
         .responseJSON { response in
         switch response.result{
         case .failure(let error):
         completion(error , false)
         print(error)
         case .success(let value):
            let json = JSON(value)
            if let api_token = json["user"]["api_token"].string
                {
                //print("api_token is ->\(api_token),id is-> \(id)")
                    print("api_token is ->\(api_token)")
                    helper.saveapi(api_token)
                completion(nil , true)
            }
         }
         
         }
    }
    
    
    class func register(name: String,email : String , pass : String , completion:@escaping (_ error: Error? , _ suc : Bool)->Void){
        let url = "http://elzohrytech.com/alamofire_demo/api/v1/register"
        let param = ["name":name,"email":email,"password":pass,"password_confirmation":pass]
        Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    completion(error , false)
                    print(error)
                case .success(let value):
                    completion(nil , true)
                    let json = JSON(value)
                    if let api_token = json["user"]["api_token"].string
                    {
                        //print("api_token is ->\(api_token),id is-> \(id)")
                        print("api_token is ->\(api_token)")
                        helper.saveapi(api_token)
                        completion(nil , true)
                    }
                    
                }
                
        }
    }
    
    
    
    
    
    
    
    
    //end class
}
