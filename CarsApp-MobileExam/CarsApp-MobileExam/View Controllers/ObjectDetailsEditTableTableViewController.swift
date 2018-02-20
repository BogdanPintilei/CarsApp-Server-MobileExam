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
    
    var changeToSave: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        fillInTextFields()
        customizeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeToSave = true
        changeSaveToEdit()
    }

    @IBAction func edit(_ sender: Any) {
        if changeToSave! {
            changeEditToSave()
            changeToSave = false
        } else {
            saveEditedObject()
            changeToSave = true
            changeSaveToEdit()
        }
    }

    @IBAction func cancel(_ sender: Any) {
        fillInTextFields()
        changeSaveToEdit()
        changeToSave = true
    }

    private func saveEditedObject() {
        let editedObject = Object(
            id: object.id!,
            name: nameTextField.text,
            model: object.model,
            status: statusTextField.text,
            year: Int(yearTextField.text!),
            km: object.km!
        )

        LoadingView.startLoadingAnimation()
        APIClient.editObject(object: editedObject) { succes in
            LoadingView.stopLoadingAnimation()
            if succes {
                self.topNameLabel.text = editedObject.name!
                print("POST /modify 200")
            } else {
                print("POST /modify 404")
            }
        }

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
        Helper.enableTextFields(textFields: textFields as! [UITextField])
    }

    private func disableTextFields() {
        let textFields = [
            nameTextField,
            statusTextField,
            yearTextField,
            kmTextField
        ]

        Helper.removeBorderWidthAndColourToTextFields(textFields: textFields as! [UITextField])
        Helper.disableTextFields(textFields: textFields as! [UITextField])
    }


    private func customizeUI() {
        disableCancelButton()
        customizeTextFields()
    }

    private func customizeTextFields() {
        let textFields = [
            idTextField,
            nameTextField,
            modelTextField,
            statusTextField,
            yearTextField,
            kmTextField
        ]
        
        Helper.applyCornerRadiusTextFieldsAndAddPadding(textFields: textFields as! [UITextField])
    }
    
    private func enableCancelButton() {
        cancelButton.isEnabled = true
        cancelButton.tintColor = UIColor.white
    }

    private func disableCancelButton() {
        cancelButton.isEnabled = false
        cancelButton.tintColor = UIColor.clear
    }

    private func changeEditToSave() {
        enableCancelButton()
        enableTextFields()
        editButton.title = "Save"
    }

    private func changeSaveToEdit() {
        disableCancelButton()
        disableTextFields()
        editButton.title = "Edit"
    }
}

