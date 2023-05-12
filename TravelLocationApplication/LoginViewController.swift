//
//  ViewController.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 9/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButton(_ sender: UIButton) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        // Validate both textfields
        
        // validationMessage(msg: "Register Account Successful", controller: self)
        if checkValidation(textFields: [usernameTextField, passwordTextField]) == false {
            validationMessage(msg: "Please fill in both fields", controller: self)
            print("checkEmptyField func works")
            return
        }
        else {
            //calling the readData() function to read through the list of users
            let users = readData()
            //declaring a found variable
            var found: User! = nil
            
            //for loop to loop through the list of users
            for us in users {
                if(us.username == username) && (us.password == password) {
                    found = us
                    //only for validation console
                    print(us.name)
                    print(us.username)
                    print(us.password)
                    print(us.email)
                    print(us.address)
                    print(us.phone)
                    
                    //alert message to navigate to Home
                    navigationMessage(msg: "Login Successful!", controller: self)
                    break
                }
            }
            
            //if matching user found
            if(found == nil) {
                validationMessage(msg: "No user found", controller: self)
                return
            }
        }
    }
    
    func navigationMessage(msg: String, controller:UIViewController){

        let alert = UIAlertController(title: "", message: msg , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            // Perform the segue to the home controller
           controller.performSegue(withIdentifier: "loginToHome", sender: nil)
                //for validation
                print("OK button tapped")
           
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
                  (action: UIAlertAction!) in controller.dismiss(animated:true, completion: nil)
                //for validation
                print("Cancel button tapped")
              }
        //adding the buttons
        alert.addAction(action)
        alert.addAction(cancelAction)
        //presenting the alert message
        controller.present(alert, animated: true, completion: nil)
    }
}

