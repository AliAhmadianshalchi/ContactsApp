//
//  DetailsViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var starButton: UIBarButtonItem!
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var EntireNameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var HomePhoneLabel: UILabel!
    @IBOutlet weak var MobilePhoneLabel: UILabel!
    @IBOutlet weak var workPhoneLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    let DetailCellId = "detailCellId"
    var noImage: UIImage? = UIImage(named: "noImage")
    
    var contact: ContactData?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntireNameLabel.text = contact?.name ?? ""
        detailLabel.text = contact?.companyName ?? "" 
        self.largeImageView.sd_setImage(with: URL(string: contact?.largeImageURL ?? ""), placeholderImage: noImage)
        
        HomePhoneLabel.text = contact?.phone?.home ?? ""
        MobilePhoneLabel.text = contact?.phone?.mobile ?? ""
        workPhoneLabel.text = contact?.phone?.work ?? ""
        emailLabel.text = contact?.emailAddress ?? ""
        birthdateLabel.text = contact?.birthdate ?? ""
    }
    

}

