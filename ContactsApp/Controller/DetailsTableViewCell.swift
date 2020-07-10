//
//  DetailsTableViewCell.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 09/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfRow: UILabel!
    @IBOutlet weak var importantDetail: UILabel!
    @IBOutlet weak var kindOfPhoneNumber: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
