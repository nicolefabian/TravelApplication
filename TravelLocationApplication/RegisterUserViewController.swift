//
//  RegisterUserViewController.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import UIKit

//if outside class then funciton or variable becomes global
//list to save all users
var usersList = [User]()

class RegisterUserViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

   

    //calls the readData() function to check user data
    var readuserListData = readData()
    //func to check if a user exists in the user list
    func isUserInList() -> Bool {
        for user in readuserListData {
            if user.username == usernameTextField.text {
                return true
            }
        }
        return false
    }
    
    @IBAction func registerButton(_ sender: Any) {
        // validationMessage(msg: "Register Account Successful", controller: self)
        if checkValidation(textFields: [nameTextField, phoneTextField, emailTextField, addressTextField, usernameTextField, passwordTextField]) == false {
            validationMessage(msg: "Textfields cannot be empty", controller: self)
            print("checkEmptyField func works")
            return
        }
        
        let rname = nameTextField.text!
        let raddress = addressTextField.text!
        let remail = emailTextField.text!
        let rphone = phoneTextField.text!
        let rusername = usernameTextField.text!
        let rpassword = passwordTextField.text!
    
        guard isInputCorrect(rname, type: "name") else {
              validationMessage(msg: "Name must have at least 2 characters", controller: self)
              return
        }
        guard isInputCorrect(remail, type: "email") else {
            validationMessage(msg: "Invalid email format", controller: self)
            return
        }
        guard isInputCorrect(rphone, type: "phone") else {
            validationMessage(msg: "Invalid phone number format", controller: self)
            return
        }
        guard isInputCorrect(rusername, type: "username") else {
              validationMessage(msg: "Username must have at least 6 characters", controller: self)
              return
        }
        guard isInputCorrect(rpassword, type: "password") else {
            validationMessage(msg: "Password must have at least 8 characters.", controller: self)
            return
        }
       
        
        print("validated input works")
        //creating user object
        let user = User (name: rname, address: raddress, email: remail, phone: rphone, username: rusername, password: rpassword)
        
        //validation
        if isUserInList() == true {
            validationMessage(msg: "Username already exists", controller: self)
        } else {
            //adding new user to list
            usersList.append(user)
            
            let data = try! NSKeyedArchiver.archivedData(withRootObject: usersList, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "usersData")
            validationMessage(msg: "Registered Successfully!", controller: self)
            // Empty out the text field inputs
            nameTextField.text = ""
            addressTextField.text = ""
            phoneTextField.text = ""
            emailTextField.text = ""
            usernameTextField.text = ""
            passwordTextField.text = ""
        }

    }
}


