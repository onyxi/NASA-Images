//
//  SearchParametersViewController.swift
//  NASA_Images
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import UIKit

// This protocol enables the SearchParametersViewController to pass selected parameters back to the delegate for use in constructing the NASA API query url
protocol SearchParametersDelegate {
    func didSelectSearchParameters(parameters: SearchParameters)
}

// This class handles lifecycle events for the app's 'Search Parameters' view
class SearchParametersViewController: UIViewController {

    @IBOutlet weak var searchTermTextField: UITextField!
    @IBOutlet weak var fromYearLabel: UILabel!
    @IBOutlet weak var toYearLabel: UILabel!
    @IBOutlet weak var fromYearStepper: UIStepper!
    @IBOutlet weak var toYearStepper: UIStepper!
    
    var delegate: SearchParametersDelegate?
    
    // hold counters for current integer values of to/from years
    var fromYear = 2017
    var toYear = 2018
    
    // When view loads add some custom formatting to the navigation bar and a gesture recognizer to enable dismissal of the soft keyboard.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // format navbar items to white color
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        
        // add tap-gesture recognizer to trigger keyboard dismissal
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // ensure date labels and steppers are configured to reflect current year as maximum value
        fromYear = Date.currentYear() - 1
        toYear = Date.currentYear()
        fromYearLabel.text = String(fromYear)
        toYearLabel.text = String(toYear)
        fromYearStepper.maximumValue = Double(Date.currentYear())
        toYearStepper.maximumValue = Double(Date.currentYear())
    }


    // This method increments/decrements the fromYear value and label in response to the user tapping the associated UIStepper - first checking to make sure that the new value would not be greater than the 'to' value
    @IBAction func fromYearStepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        if stepperValue <= toYear {
            fromYear = stepperValue
            fromYearLabel.text = String(fromYear)
        } else {
            sender.value -= 1
        }
    }
    

    // This method increments/decrements the toYear value and label in response to the user tapping the associated UIStepper - first checking to make sure that the new value would not be less than than the 'from' value
    @IBAction func toYearStepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        if stepperValue >= fromYear {
            toYear = stepperValue
            toYearLabel.text = String(toYear)
        } else {
            sender.value += 1
        }
    }
    
    

    // This method instanciates a new SearchParameters object from the ViewController's current state and passes it back to the delegate
    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let txt = searchTermTextField.text, searchTermTextField.text != "" else { return }
        delegate?.didSelectSearchParameters(parameters: SearchParameters(searchString: txt, fromYear: fromYear, toYear: toYear))
        _ = navigationController?.popViewController(animated: true)
    }
    

    // This method dismisses the soft keyboard if displayed
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
