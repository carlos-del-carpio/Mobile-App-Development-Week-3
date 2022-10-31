//
//  ViewControllerUpdateEmail.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/22/21.
//

import UIKit

class ViewControllerUpdateEmail: UIViewController {
    @IBOutlet weak var updateEmailInput: UITextField!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEmailInput.text = user!.email
    }
    @IBAction func cancelEmailUpdateButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if updateEmailInput.text != "" {
            user!.email = updateEmailInput.text!
            
            return true
        } else {
            showAlert(title: "Missing Email", message: "Please enter an email address.")
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindBackToProfileFromEmailUpdate" {
            let destinationViewController = segue.destination as! ProfileViewController
            
            destinationViewController.user = user
        }
    }
}
