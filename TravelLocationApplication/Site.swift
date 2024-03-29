//
//  Site.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import Foundation
import UIKit


class Site: NSObject, NSCoding {
    
    //site values
    var siteName: String
    var siteAddress: String
    var siteDescription: String
    var sitePicture: UIImage
    var siteDate: String
    
    init(siteName: String, siteAddress: String, siteDescription: String, sitePicture: UIImage, siteDate: String) {
        self.siteName = siteName
        self.siteAddress = siteAddress
        self.siteDescription = siteDescription
        self.sitePicture = sitePicture
        self.siteDate = siteDate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(siteName, forKey: "siteName")
        coder.encode(siteAddress, forKey: "siteAddress")
        coder.encode(siteDescription, forKey: "siteDescription")
        coder.encode(sitePicture, forKey: "sitePicture")
        coder.encode(siteDate, forKey: "siteDate")
    }
    
    required init?(coder: NSCoder) {
        self.siteName = coder.decodeObject(forKey: "siteName") as! String
        self.siteAddress = coder.decodeObject(forKey: "siteAddress") as! String
        self.siteDescription = coder.decodeObject(forKey: "siteDescription") as! String
        self.sitePicture = coder.decodeObject(forKey: "sitePicture") as! UIImage
        self.siteDate = coder.decodeObject(forKey: "siteDate") as! String
    }
}

// func to get currentDate and converting to string
func getSiteDate() -> String
{
    // get current date
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    // sample date input : 13/05/2023
    dateFormatter.dateFormat = "dd/MM/yyyy"
    // converting date to string
    return dateFormatter.string(from: date)
}

//getting the data from the site list
func readSiteData()  -> [Site] {
    if UserDefaults.standard.value (forKey: "sitesData") != nil
    {
        let data = UserDefaults.standard.value(forKey: "sitesData") as! Data
        let sitesData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        return sitesData as! [Site]
    } else
    {
        //returning empty list if no data 
        return [Site] ()
    }
}
    
