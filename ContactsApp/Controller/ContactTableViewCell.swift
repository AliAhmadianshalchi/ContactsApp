//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit
import Foundation

class ContactTableViewCell: UITableViewCell{
    
    @IBOutlet weak var smallImageView: UIImageView!
    @IBOutlet weak var nameAndLastNameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var favoriteStar: UIImageView!
    
    var noImage: UIImage? = UIImage(named: "noImage")
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ Contact: ContactModel) {
        self.nameAndLastNameLabel.text = Contact.name
        self.detailsLabel.text = Contact.companyName
        
//        self.smallImageView.sd_setImage(with: URL(string: Contact.smallImageURL), placeholderImage: noImage)
        
    }
    
    
}
