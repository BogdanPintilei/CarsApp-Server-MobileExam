//
//  ApiClientObject.swift
//  CarsApp-MobileExam
//
//  Created by Bogdan Pintilei on 2/20/18.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation

extension APIClient {
    
    class func getObjects(completion: @escaping (_ levels: [Object]) -> Void) {
        let path = "cars"
        get(path: path) { json in
            if (json as? [[String: AnyObject]]) != nil {
                let cars = Factory.objectsFromJsonArray(jsonArray: json as! [[String : AnyObject]])
                completion(cars)
            } else {
                completion([Object]())
            }
            
        }
    }
    
    class func editObject(object: Object, completion: @escaping (_ success: Bool) -> Void) {
        let path = "modify"
        let params = objectParams(object)
        post(path: path, params: params) { json in
            if json != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }

    class func objectParams(_ object: Object) -> [String: Any] {
        var params = [String: Any]()
        
        if let id = object.id {
            params["id"] = id
        }
        
        if let name = object.name {
            params["name"] = name
        }
        
        if let status = object.status {
            params["status"] = status
        }
        
        if let year = object.year  {
            params["year"] = year
        }
        
        print(params)
        return params
    }
    
}
