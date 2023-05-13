//
//  ExistingSiteViewController.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import UIKit

class ExistingSiteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var sitesTable: UITableView!
    
    @IBOutlet weak var siteSearchBar: UISearchBar!
    
    var searchedSites = [Site]()
    var sitesData = readSiteData() //set up table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        //siteList = all the sites data
        searchedSites = sitesData
    }
    
    private func setUpTable() {
        siteSearchBar.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning all the sitesList count
        return searchedSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExistingSiteTableViewCell
        
        //displaying each site
        cell.siteNameLabel.text = searchedSites[indexPath.row].siteName
        cell.sitePicImageView.image = searchedSites[indexPath.row].sitePicture
        cell.siteAddressLabel.text = searchedSites[indexPath.row].siteAddress
        cell.descriptionLabel.text = searchedSites[indexPath.row].siteDescription
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //creating a new list for searchedSites
        searchedSites = []
        //if the text in searchbar is null
        if searchText == "" {
            //show all the existing sites
            searchedSites = sitesData
        }
        //for every site in the sitesData
        for eachSite in sitesData {
            //if the sitename and date saved/added matches with the searchtext input
            if eachSite.siteName.lowercased().contains(searchText.lowercased()) || eachSite.siteDate.lowercased().contains(searchText.lowercased()) {
                //add it to the searchedSites
                searchedSites.append(eachSite)
            }
        }
        //reload the table
        sitesTable.reloadData()
    }
}
           
