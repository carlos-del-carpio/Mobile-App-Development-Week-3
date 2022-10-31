//
//  ProfileViewController.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/18/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameOutput: UILabel!
    @IBOutlet weak var emailOutput: UILabel!
    @IBOutlet weak var passwordOutput: UILabel!
    @IBOutlet weak var departmentOutput: UILabel!
    var user : User? 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserData()
    }
    @IBAction func profileCloseButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileToUpdateName" {
            let destinationViewController = segue.destination as! ViewControllerUpdateName
            
            destinationViewController.user = self.user
        } else if segue.identifier == "profileToUpdateEmail" {
            let destinationViewController = segue.destination as! ViewControllerUpdateEmail
            
            destinationViewController.user = self.user
        } else if segue.identifier == "profileToUpdatePassword" {
            let destinationViewController = segue.destination as! ViewControllerUpdatePassword
            
            destinationViewController.user = self.user
        } else if segue.identifier == "profileToUpdateDepartment" {
            let destinationViewController = segue.destination as! ViewControllerUpdateDepartment
            
            destinationViewController.user = self.user
        }
    }
    
    
    @IBAction func unwindBackToProfile(unwindSegue: UIStoryboardSegue) {
        loadUserData()
    }
    
    
    func getHiddenPassword(password : String) -> String {
        var returnString : String = ""
        
        for _ in password { returnString += "*" }
        
        return  returnString
    }
    
    
    func loadUserData() {
        nameOutput.text = user!.name
        emailOutput.text = user!.email
        passwordOutput.text = getHiddenPassword(password: user!.password)
        departmentOutput.text = user!.department
    }
}
