//
//  ObjectDetailsEditTableTableViewController.swift
//  CarsApp-MobileExam
//
//  Created by Bogdan Pintilei on 2/20/18.
//  Copyright © 2018 Bogdan. All rights reserved.
//

import UIKit

class ObjectDetailsEditTableTableViewController: UITableViewController {

    @IBOutlet var topNameLabel: UILabel!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var statusTextField: UITextField!
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var kmTextField: UITextField!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    var object = Object()

    override func viewDidLoad() {
        super.viewDidLoad()
        fillInTextFields()
        customizeUI()
    }
    
    @IBAction func edit(_ sender: Any) {
        enableTextFields()
        editButton.title = "Save"
        enableCancelButton()
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
    
    private func fillInTextFields() {
        topNameLabel.text = object.name!
        idTextField.text = "\(object.id!)"
        nameTextField.text = object.name!
        modelTextField.text = object.model!
        statusTextField.text = object.status!
        yearTextField.text = "\(object.year!)"
        kmTextField.text = "\(object.km!)"
    }

    private func enableTextFields() {
        let textFields = [
            nameTextField,
            statusTextField,
            yearTextField,
            kmTextField
        ]
        Helper.applyBorderWidthAndColourToTextFields(textFields: textFields as! [UITextField])
        Helper.applyCornerRadiusTextFieldsAndAddPadding(textFields: textFields as! [UITextField])
    }

    private func customizeUI() {
        disableCancelButton()
    }
    
    private func enableCancelButton() {
        cancelButton.isEnabled = true
        cancelButton.tintColor = UIColor.white
    }
    
    private func disableCancelButton() {
        cancelButton.isEnabled = false
        cancelButton.tintColor = UIColor.clear
    }
}
