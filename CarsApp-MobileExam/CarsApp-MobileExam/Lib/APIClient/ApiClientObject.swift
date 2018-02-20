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
    

}
