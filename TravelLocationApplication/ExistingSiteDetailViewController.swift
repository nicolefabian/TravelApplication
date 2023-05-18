//
//  ExistingSiteDetailViewController.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 17/05/23.
//

import UIKit

class ExistingSiteDetailViewController: UIViewController {

    @IBOutlet weak var siteNameLabel: UILabel!
    @IBOutlet weak var siteAddressLabel: UILabel!
    @IBOutlet weak var siteDescriptionLabel: UILabel!
    @IBOutlet weak var siteDateLabel: UILabel!
    
    @IBOutlet weak var siteImagePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //displaying the details
        siteNameLabel.text = "Name: \(site.siteName)"
        siteAddressLabel.text = "Address: \(site.siteAddress)"
        siteDescriptionLabel.text = "Description: \(site.siteDescription)"
        siteDateLabel.text = "Date: \(site.siteDate)"
        siteImagePic.image =  site.sitePicture
    }
}
