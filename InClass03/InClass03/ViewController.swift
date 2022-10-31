//
//  ViewController.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/18/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var departmentSelector: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        formFieldsComplete()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToProfile" {
            let destinationViewController = segue.destination as! ProfileViewController
            
            let user = User(name: nameTextField.text!
                            , email: emailTextField.text!
                            , password: passwordTextField.text!
                            , department: departmentSelector.titleForSegment(at: departmentSelector.selectedSegmentIndex)!
                            , departmentIndex: departmentSelector.selectedSegmentIndex)
            
            destinationViewController.user = user
        }
    }
    
    
    func formFieldsComplete() -> Bool {
        if nameTextField.text != "" {
            if emailTextField.text != ""{
                if passwordTextField.text != ""{
                    if departmentSelector.selectedSegmentIndex >= 0 {
                        return true
                    } else {
                        showAlert(title: "Missing Department Selection", message: "Please select a department.")
                    }
                } else {
                    showAlert(title: "Missing Password", message: "Please enter a password.")
                }
            } else {
                showAlert(title: "Missing Email", message: "Please enter a valid email address.")
            }
        } else {
            showAlert(title: "Missing Name", message: "Please enter your name.")
        }
        
        
        return false
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
