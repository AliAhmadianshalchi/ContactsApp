//
//  ContactsTableViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    @IBOutlet var ContactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }



    override func tableView(_ ContactsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
    override func tableView(_ ContactsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ContactTableViewCell else { return UITableViewCell() }
//            cell.setup(laptops[indexPath.row])
            
            return cell
        }

 

}

