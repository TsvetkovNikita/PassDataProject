//
//  secondViewController.swift
//  PassDataProject
//
//  Created by Nikita Tsvetkov on 21/09/2019.
//  Copyright © 2019 Nikita Tsvetkov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var uiElements = ["UILabel",
                      "UIButton",
                      "UIDatePicker",
                    "UITextField"]
    var selectedElement: String?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var hideElementsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    

    
    var login: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let login = login else { return }
label.text = "Hello, \(login)!"
        datePicker.locale = Locale(identifier: "ru_Ru")
        
        choiceUiElement()
        createToolbar()
    }
    
    func hideAllElements() {
        label.isHidden = true
        backButton.isHidden = true
        DateLabel.isHidden = true
        datePicker.isHidden = true
    }
    
    func choiceUiElement() {
        let elementPicker = UIPickerView()
       elementPicker.delegate = self
        textField.inputView = elementPicker
        
        // Customization
        
        elementPicker.backgroundColor = .magenta
        
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done",
                                         style:.plain,
                                         target: self,
                                         action: #selector(keyboardDismissed))
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        // Customization
        
        toolbar.barTintColor = .magenta
        toolbar.tintColor = .white
    }
    
    @objc func keyboardDismissed() {
    view.endEditing(true)
    }
    

    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "Ru_ru")
        let dateValue = dateFormatter.string(from: sender.date)
        DateLabel.text = dateValue
    }

    @IBAction func turnSwitch(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        backButton.isHidden = !backButton.isHidden
        datePicker.isHidden = !datePicker.isHidden
        DateLabel.isHidden = !DateLabel.isHidden
        
        
        if sender.isOn {
            hideElementsLabel.text = "Отобразить все элементы"
        } else {
            hideElementsLabel.text = "Скрыть все элементы"
        }
    }
}

extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        switch row {
        case 0:
            hideAllElements()
            label.isHidden = false
            DateLabel.isHidden = false
        case 1:
            hideAllElements()
            backButton.isHidden = false
        case 2:
            hideAllElements()
            datePicker.isHidden = false
        default:
            hideAllElements()
    
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 28)
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
}
