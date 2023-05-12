//
//  ExistingSiteTableViewCell.swift
//  TravelLocationApplication
//
//  Created by Nicole  on 10/05/23.
//

import UIKit

class ExistingSiteTableViewCell: UITableViewCell {


    @IBOutlet weak var siteNameLabel: UILabel!
    @IBOutlet weak var siteAddressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sitePicImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
