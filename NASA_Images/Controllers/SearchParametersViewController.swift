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

class SearchParametersViewController: UIViewController {

    @IBOutlet weak var searchTermTextField: UITextField!
    
    var delegate: SearchParametersDelegate?
    
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
        
    }
    
    // This method dismisses the soft keyboard if displayed
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    // This method instanciates a new SearchParameters object from the ViewController's current state and passes it back to the delegate
    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let txt = searchTermTextField.text, searchTermTextField.text != "" else { return }
        delegate?.didSelectSearchParameters(parameters: SearchParameters(searchString: txt))
        _ = navigationController?.popViewController(animated: true)
    }
    

}
