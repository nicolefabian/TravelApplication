//
//  AddNewSiteViewController.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import UIKit

var siteList = [Site]()


class AddNewSiteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var siteImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //for uploading image
    @IBAction func uploadImageButton(_ sender: UIButton) {
        let sitePick = UIImagePickerController()
        //getting all photos from the photolibrary
        sitePick.sourceType = .photoLibrary
        sitePick.delegate = self
        sitePick.allowsEditing = true
        //showing sitePick to screen
        present(sitePick, animated: true, completion: nil)
    }
    
    //inbuilt function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //selecting image
        let pic = info[.originalImage] as! UIImage
        siteImage.image = pic
        //go back to the page
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewSiteImage(_ sender: UIButton) {
        //getting the input
        let sname = nameTextField.text!
        let saddress = addressTextField.text!
        let sdescription = descriptionTextField.text!
        let spic = siteImage.image
        let sdate = getSiteDate()
        
        if(checkValidation(textFields: [nameTextField, addressTextField, descriptionTextField]) && siteImage.image != nil)
        {
            //created site object
            let sites = Site(siteName: sname, siteAddress: saddress, siteDescription: sdescription, sitePicture: spic!, siteDate: sdate)
            
            //adding each site to the siteList
            siteList = readSiteData()
            siteList.append(sites)
            
            let data = try! NSKeyedArchiver.archivedData(withRootObject: siteList, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "sitesData")
            validationMessage(msg: "Added new site successfully!", controller: self)
            //for validation
            print("Added site successfully!")
            
            //clearing the values
            nameTextField.text = ""
            addressTextField.text = ""
            descriptionTextField.text = ""
            siteImage.image = nil
        } else {
            validationMessage(msg: "Missing fields", controller: self)
        }
    }
}

