//
//  DrinksViewController.swift
//  HW02
//
//  Created by Carlos Del Carpio on 9/22/21.
//

import UIKit

class DrinksViewController: UIViewController {
    @IBOutlet weak var ouncesInput: UITextField!
    @IBOutlet weak var drinkSelector: UISegmentedControl!
    var ounces : Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ounces = ounces {
            self.ouncesInput.text = String(format: "%d", ounces)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let _ =  Double(ouncesInput.text!) {
            if drinkSelector.selectedSegmentIndex >= 0 {
                return true
            } else {
                showAlert(title: "Drink Type Missing", message: "Please select a drink type.")
            }
        } else {
            showAlert(title: "Ounces Missing", message: "Please enter a valid amount in ounces.")
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindBackToMain" {
            let destinationViewController = segue.destination as! MainViewController
            
            
            destinationViewController.ounces = Double(ouncesInput.text!)
            destinationViewController.drinkSelectedIndex = drinkSelector.selectedSegmentIndex
            
            switch drinkSelector!.titleForSegment(at: drinkSelector.selectedSegmentIndex) {
            case "Beer"              : destinationViewController.alcoholPercent = 0.05
            case "Malt Liquor"       : destinationViewController.alcoholPercent = 0.07
            case "Table Wine"        : destinationViewController.alcoholPercent = 0.12
            case "Distilled Spirits" : destinationViewController.alcoholPercent = 0.4
            default                  : destinationViewController.alcoholPercent = 0.00
            }
        }
    }
}
