//
//  ViewControllerUpdateDepartment.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/22/21.
//

import UIKit

class ViewControllerUpdateDepartment: UIViewController {
    @IBOutlet weak var updateDepartmentSegment: UISegmentedControl!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateDepartmentSegment.selectedSegmentIndex = user!.departmentIndex
    }
    
    
    @IBAction func cancelDepartmentUpdateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if updateDepartmentSegment.selectedSegmentIndex >= 0 {
            user!.department = updateDepartmentSegment.titleForSegment(at: updateDepartmentSegment.selectedSegmentIndex)!
            user!.departmentIndex = updateDepartmentSegment!.selectedSegmentIndex
            
            return true
        } else {
            showAlert(title: "Missing Department", message: "Please select your department.")
        }
        
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindBackToProfileFromDepartmentUpdate" {
            let destinationViewController = segue.destination as! ProfileViewController
            
            destinationViewController.user = user
        }
    }
}
