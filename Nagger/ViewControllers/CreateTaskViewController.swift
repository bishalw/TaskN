//
//  CreateTaskViewController.swift
//  Nagger
//
//  Created by Bishal Wagle on 3/5/19.
//  Copyright © 2019 Bishal Wagle. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    @IBOutlet var taskTitleTextField: UITextField!
    @IBOutlet var taskDescriptionTextField: UITextField!
    @IBOutlet var taskStartDatePickerButton: UIButton!
    @IBOutlet var taskEndDatePickerButton: UIButton!
    
    var startDatePickerView: UIDatePicker!
    var endDatePickerView: UIDatePicker!
    
    // Start Date picker
    @IBAction func taskStartDatePickerButtonPressed(_ sender: Any) {
        startDatePickerView = UIDatePicker(frame: self.taskStartDatePickerButton.bounds)
        startDatePickerView.backgroundColor = UIColor.white
        
        self.taskStartDatePickerButton.addSubview(startDatePickerView)

        print("task start date picker button pressed")
    }
    // End Date picker
    @IBAction func taskEndDatePickerButtonPressed(_ sender: Any) {
        endDatePickerView = UIDatePicker(frame: self.taskEndDatePickerButton.bounds)
        endDatePickerView.backgroundColor = UIColor.white
        
        self.taskEndDatePickerButton.addSubview(endDatePickerView)
        print("task end date picker button pressed")
    }
    
    //Creates Task
    
    @IBAction func createTaskButtonPressed(_ sender: Any) {
        guard let title = taskTitleTextField.text
            , let description = taskDescriptionTextField.text else {
            return
        }
        
        let startDate = startDatePickerView.date
        let endDate = endDatePickerView.date
        let task = [Task.init(title: title, description:  description, startDate: startDate, endDate: endDate)]
        print(task[0])
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitleTextField.delegate = self
        taskDescriptionTextField.delegate = self
        
      
    }
    func textField(_ textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textFieldToChange == taskTitleTextField{
            guard let text = textFieldToChange.text else { return true }
            let count = text.count + string.count - range.length
            return count <= 25
        }else if textFieldToChange == taskDescriptionTextField{
            guard let text = textFieldToChange.text else { return true }
            let count = text.count + string.count - range.length
            return count <= 150
        }
       return true
    }
    
    
    
    
}

extension CreateTaskViewController: InstantiableFromStoryboard {
    static var storyBoardName: String = "Main"
    static var storyBoardIdentifier: String = "CreateTaskViewController"
}
extension CreateTaskViewController: UITextFieldDelegate{
    
}
