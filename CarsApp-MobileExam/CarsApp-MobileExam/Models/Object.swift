//
//  Object.swift
//  CarsApp-MobileExam
//
//  Created by Bogdan Pintilei on 2/20/18.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class Object: NSObject {

    var id: Int?
    var name: String?
    var model: String?
    var status: String?
    var km: Int?
    var year: Int?

    init(
        id: Int? = 0,
        name: String? = "",
        model: String? = "",
        status: String? = "",
        year: Int? = 0,
        km: Int? = 0
    ) {
        self.id = id
        self.name = name
        self.model = model
        self.status = status
        self.year = year
        self.km = km
    }
    
}
