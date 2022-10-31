//
//  ViewControllerUpdatePassword.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/22/21.
//

import UIKit

class ViewControllerUpdatePassword: UIViewController {
    @IBOutlet weak var updatePasswordInput: UITextField!
    var user : User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePasswordInput.text = user!.password
    }
    
    
    @IBAction func cancelPasswordUpdateButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if updatePasswordInput.text != "" {
            user!.password = updatePasswordInput.text!
            
            return true
        } else {
            showAlert(title: "Missing Password", message: "Please enter a password.")
        }
        
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindBackToProfileFromPasswordUpdate" {
            let destinationViewController = segue.destination as! ProfileViewController
            
            destinationViewController.user = user
        }
    }
}
