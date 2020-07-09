//
//  DetailsViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var starButton: UIBarButtonItem!
    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var EntireNameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var noImage: UIImage? = UIImage(named: "noImage")
    
    var contact: ContactModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntireNameLabel.text = contact?.name
        detailLabel.text = contact?.companyName
        
        guard let urlImage = contact?.largeImageURL else {
            return
        }
//        self.largeImageView.sd_setImage(with: URL(string: urlImage), placeholderImage: noImage)
        
    }
    


}

//extension DetailsViewController: UITableViewDelegate , UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//}
