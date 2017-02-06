//
//  ViewController.swift
//  Ch2-WorldTrotter
//
//  Created by Ben Smith on 05/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ConversionVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldOutlet: UITextField!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Measurement<UnitTemperature>?
    
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    @IBOutlet var celciusLabel: UILabel!
    var farenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    func updateCelciusLabel(){
        
        if let celciusValue = celciusValue {
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusLabel.text = "???"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func fareEditing(_ textField: UITextField){
        if let text = textField.text,
            let value = Double(text) {
            farenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            farenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        textFieldOutlet.resignFirstResponder()
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let textDecimalSep = textField.text?.range(of: ".")
//        let replTextDecSep = string.range(of: ".")
//        
//        if textDecimalSep != nil,
//            replTextDecSep != nil {
//            return false
//        }
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelciusLabel()
    }
    
    
}

