//
//  User.swift
//  InClass03
//
//  Created by Carlos Del Carpio on 9/21/21.
//

import Foundation

class User {
    var name : String
    var email : String
    var password : String
    var department : String
    var departmentIndex : Int
    
    init(name : String, email : String, password : String, department : String, departmentIndex : Int) {
        self.name = name
        self.email = email
        self.password = password
        self.department = department
        self.departmentIndex = departmentIndex
    }
}
