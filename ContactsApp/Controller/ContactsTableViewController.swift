//
//  ContactsTableViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController  {
    
    @IBOutlet var ContactsTableView: UITableView!
    
    let cellId = "ContactCell"
    var contactManager = ContactManager()
    
    var rowToshow: ContactModel? {
        didSet {
            performSegue(withIdentifier: "showDetails", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactManager.delegate = self
        
        ContactsTableView.delegate = self
        ContactsTableView.dataSource = self
        
    }
    
    override func tableView(_ ContactsTableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return contactManager.parseJSON(ContactData)
    }
    
    override func tableView(_ ContactsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ContactTableViewCell else { return UITableViewCell() }
        cell.setup(contacts[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.contact = rowToshow
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetails", sender: self)
            rowToshow = contacts[indexPath.row]
        }

 
}

extension ContactsTableViewController: ContactManagerDelegate {
    
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactModel) {
        
        DispatchQueue.main.async {
//            self.temperatureLabel.text = contact.
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//            self.cityLabel.text = weather.cityName
        }
//        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

