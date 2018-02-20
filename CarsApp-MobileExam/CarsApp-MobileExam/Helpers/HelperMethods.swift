//
//  HelperMethods.swift
//  CarsApp-MobileExam
//
//  Created by Bogdan Pintilei on 2/20/18.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import Foundation
import UIKit

class Helper {

    static func applyCornerRadiusTextFieldsAndAddPadding(textFields: [UITextField]) {
        for textField in textFields {
            textField.layer.cornerRadius = 8
            textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        }
    }

    static func applyBorderWidthAndColourToTextFields(textFields: [UITextField]) {
        for textField in textFields {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}
