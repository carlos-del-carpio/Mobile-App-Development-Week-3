//
//  ViewControllerUpdateUser.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/21/21.
//

import UIKit

class ViewControllerUpdateName: UIViewController {
    @IBOutlet weak var updateNameInput: UITextField!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNameInput.text = user!.name
    }
    @IBAction func cancelNameUpdateButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if updateNameInput.text != "" {
            user!.name = updateNameInput.text!
            
            return true
        } else {
            showAlert(title: "Missing Name", message: "Please enter your name.")
        }
        
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindBackToProfileFromNameUpdate" {
            let destinationViewController = segue.destination as! ProfileViewController
            
            destinationViewController.user = user
        }
    }
}
