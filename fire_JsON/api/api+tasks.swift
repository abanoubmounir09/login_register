//
//  api+tasks.swift
//  fire_JsON
//
//  Created by pop on 12/17/19.
//  Copyright © 2019 pop. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension api {
    //var url = "http://elzohrytech.com/alamofire_demo/api/v1/tasks"
    class func tasks(completion:@escaping (_ error:Error?,_ tasks:[Taskmodel]?)->Void){
        let url = "http://elzohrytech.com/alamofire_demo/api/v1/tasks"
        guard let api_token = helper.getipToken() else{
            completion(nil,nil)
            return
        }
        
        let parameter = ["api_token" : api_token]
        Alamofire.request(url, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result{
                case .failure(let error):
                    completion(error , nil)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    guard let dataarr = json["data"].array else {
                        completion(nil, nil)
                        return
                    }
                    var arr = [Taskmodel]()
                    for item in dataarr{
                        guard let item = item.dictionary else{return}
                        let task = Taskmodel()
                        task.id = item["id"]?.int ?? 0
                        task.task = item["task"]?.string ?? ""
                        task.completed = item["completed"]?.bool ?? false
                        arr.append(task)
                    }
                    completion(nil,arr)
    }
        }
 }
}









