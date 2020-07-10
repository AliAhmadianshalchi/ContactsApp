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
    
    @IBOutlet weak var detailTableView: UITableView!
    
    let DetailCellId = "detailCellId"
    var noImage: UIImage? = UIImage(named: "noImage")
    
    var contact: ContactData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntireNameLabel.text = contact?.name ?? ""
        detailLabel.text = contact?.companyName ?? "" 
        self.largeImageView.sd_setImage(with: URL(string: contact?.largeImageURL ?? ""), placeholderImage: noImage)
        
    }
    


}

extension DetailsViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return [contact].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCellId) as? DetailsTableViewCell else { return UITableViewCell() }
        
        cell.nameOfRow.text = contact?.name
        cell.importantDetail.text = contact?.companyName
        cell.kindOfPhoneNumber.text = contact?.companyName
        
        return cell
    }

}
