//
//  User.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import Foundation
//for the UIAlertController
import UIKit


class User : NSObject, NSCoding {
    
    var name: String
    var address: String
    var email: String
    var phone: String
    var username: String
    var password: String
    
    //constructor
    init(name:String, address:String, email:String, phone: String, username: String, password: String) {
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.username = username
        self.password = password
    }
    
    //encoding the data
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(email, forKey: "email")
        coder.encode(phone, forKey: "phone")
        coder.encode(username, forKey: "username")
        coder.encode(password, forKey: "password")
    }
    
    //decoding user data
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.email = coder.decodeObject(forKey: "email") as! String
        self.phone = coder.decodeObject(forKey: "phone") as! String
        self.username = coder.decodeObject(forKey: "username") as! String
        self.password = coder.decodeObject(forKey: "password") as! String
    }
}

//--global functions for user

//getting all the data from user list
func readData()  -> [User] {
    if UserDefaults.standard.value (forKey: "usersData") != nil
    {
        let data = UserDefaults.standard.value(forKey: "usersData") as! Data
        let usersData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        return usersData as! [User]
    } else
    {
        return [User] ()
    }
}

//validating all textfields
func checkValidation(textFields: [UITextField]) -> Bool
{
    //checking if empty
    for textfield in textFields
    {
        if let text = textfield.text, !text.isEmpty
        {
            return true
        }
    }
    return false
}

//alert message
func validationMessage (msg: String, controller:UIViewController){
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert);
    let validateAction = UIAlertAction(title: "OK", style: .default) {
        action in controller.dismiss(animated: true, completion: nil)
        }
    alert.addAction(validateAction)
    controller.present(alert, animated: true, completion: nil)
}

//func to check each textfield in RegisterUserViewController
func isInputCorrect(_ input: String, type: String) -> Bool {
    let predicateFormat: String
    switch type {
    case "name":
        return input.count >= 2
    case "address":
        return input.count >= 6
    case "username":
        return input.count >= 6
    case "email":
        predicateFormat = "SELF MATCHES %@"
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: predicateFormat, emailRegex)
        return emailPredicate.evaluate(with: input)
    case "password":
        return input.count >= 8
    case "phone":
        predicateFormat = "SELF MATCHES %@"
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: predicateFormat, phoneRegex)
        return phonePredicate.evaluate(with: input)
    default:
        return false
    }
}
