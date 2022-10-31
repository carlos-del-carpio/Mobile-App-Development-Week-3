//
//  ViewController.swift
//  HW02
//
//  Created by Carlos Del Carpio on 9/22/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var genderSelection: UISegmentedControl!
    @IBOutlet weak var hoursSinceLastDrinkInput: UITextField!
    @IBOutlet weak var bacLevelOutput: UILabel!
    @IBOutlet weak var bacStatusOutput: UILabel!
    var ounces : Double?
    var alcoholPercent : Double?
    var drinkSelectedIndex : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        if let _ = Double(weightInput.text!) {
            if genderSelection.selectedSegmentIndex >= 0 {
                if let _ = Double(hoursSinceLastDrinkInput.text!) {
                    if let _ = ounces {
                        if let _ = alcoholPercent {
                            let bac = calculateBAC()
                            
                            bacLevelOutput.text = String(format: "%.2f", bac)
                            
                            switch bac {
                            case ...0.08     : bacStatusOutput.text = "You're safe"
                            case 0.09..<0.20 : bacStatusOutput.text = "Be careful..."
                            case 0.20...     : bacStatusOutput.text = "Over the limit!"
                            default          : resetBACLabels()
                            }
                        } else {
                            showAlert(title: "Drink Type Missing", message: "Please go to the Drink Information screen and select a drink type.")
                        }
                    } else {
                        showAlert(title: "Ounces Missing", message: "Please go to the Drink Information screen and enter a valid amount in ounces.")
                    }
                } else {
                    showAlert(title: "Hours Missing", message: "Please enter a valid time in hours.")
                }
            } else {
                showAlert(title: "Gender Missing", message: "Please select a gender.")
            }
        } else {
            showAlert(title: "Weight Error", message: "Please enter a valid weight.")
        }
    }
    
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        clearData()
    }
    
    
    func calculateBAC() -> Double{
        var weightTimesGender : Double
        var actualBAC : Double
        let ouncesTimesAlcPer : Double = ((ounces! * alcoholPercent!))
        let hoursCalculation = 0.015 * Double(hoursSinceLastDrinkInput.text!)!
        
        if genderSelection.titleForSegment(at: genderSelection.selectedSegmentIndex) == "Male" {
            weightTimesGender = Double(weightInput.text!)! * 0.68
        } else {
            weightTimesGender = Double(weightInput.text!)! * 0.55
        }
        
        actualBAC = (ouncesTimesAlcPer * (5.14 / weightTimesGender)) - hoursCalculation

        print("alcohol percent = \(alcoholPercent), weight times gender = \(weightTimesGender), ounces times alc per = \(ouncesTimesAlcPer), and hours calculation = \(hoursCalculation) = \(actualBAC)")
                                                               
        return actualBAC
    }
    
    
    func clearData() {
        weightInput.text = ""
        genderSelection.selectedSegmentIndex = UISegmentedControl.noSegment
        hoursSinceLastDrinkInput.text = ""
        resetBACLabels()
    }
    
    
    func resetBACLabels() {
        bacLevelOutput.text = "BAC Level"
        bacStatusOutput.text = "BAC Status"
    }
    
    
    @IBAction func unwindBackToMain(unwindSegue: UIStoryboardSegue) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DrinksViewController
        
        if let ounces = ounces {
            destinationVC.ounces = ounces
        }
//
//        if let drinkSelectedIndex = drinkSelectedIndex {
//            destinationVC.drinkSelector.selectedSegmentIndex = drinkSelectedIndex
//        }
    }
}


extension UIViewController {
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
