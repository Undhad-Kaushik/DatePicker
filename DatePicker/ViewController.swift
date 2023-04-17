//
//  ViewController.swift
//  DatePicker
//
//  Created by undhad kaushik on 13/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bookingDateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //   extrafuncMultyDateMethods()
        setup()
        configurDatePicker()
        
    }
    
    
//    private func extrafuncMultyDateMethods() {
//        print(Date())
//        Date().convertToString(formet: "dd/MM/yyyy")    // date slesh
//        Date().convertToString(formet: "dd-MM-yyyy")    // date des
//        Date().convertToString(formet: "dd MMM yyyy")   // Month
//        Date().convertToString(formet: "dd MM yyyy hh:mm")  // time hour,minit
//        Date().convertToString(formet: "dd MM yyyy hh:mm a")    // AM , PM
//        Date().convertToString(formet: "dd MM yyyy hh:mm HH:mm")    // 24 Hour
//
//    }
    
    private func setup() {
        bookingDateTextField.delegate = self
    }
    
    private func configurDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())
        datePicker.minimumDate = Date()
    }
    
    @IBAction func datePickerChangeValue(_ sender: UIDatePicker) {
        print(sender.date)
        bookingDateTextField.text = sender.date.convertToString(formet: "dd MMM yyyy hh:mm:ss a")
        Calendar.current.date(byAdding: .year, value: -2, to: sender.date)
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            datePicker.isHidden = false
        return false
        }
        return true
    }
}


extension String {
    func convertToString(formet: String) -> Date {
        let formetter = DateFormatter()
        formetter.dateFormat = formet
        return formetter.date(from: self) ?? Date()
    }
}

extension Date {
    func convertToString(formet: String) -> String {
        let formetter = DateFormatter()
        formetter.dateFormat = formet
        return formetter.string(from: self)
    }
}
