//
//  ContactsTableViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit
import SDWebImage

class ContactsTableViewController: UITableViewController  {
    
    @IBOutlet var ContactsTableView: UITableView!
    
    var contacts: [ContactData] = []
    let cellId = "ContactCell"
    
    var noImage: UIImage? = UIImage(named: "noImage")
    let detailsViewController = DetailsViewController()
    
    var rowToshow: ContactData? {
        didSet {
            performSegue(withIdentifier: "showDetails", sender: self)
        }
    }
    
    let ContactUrl = URL(string: "https://s3.amazonaws.com/technical-challenge/v3/contacts.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson()
        tableView.tableFooterView = UIView()
        
        ContactsTableView.delegate = self
        ContactsTableView.dataSource = self
        
    }
    
    func downloadJson() {
        guard let downloadURL = ContactUrl else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            do
            {
                let decoder = JSONDecoder()
                let downloadedContacts = try decoder.decode([ContactData].self, from: data)
                self.contacts = downloadedContacts
                DispatchQueue.main.async {
                    self.ContactsTableView.reloadData()
                }
            } catch {
                print("something wrong after downloaded")
            }
        }.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.contact = rowToshow
            ContactsTableView.deselectRow(at: ContactsTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch(section) {
          case 0:return "Favorite Contacts"

          default :return "Other Contacts"

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0  {
            let favorites = contacts.filter { (contactData) -> Bool in
                return contactData.isFavorite ?? false
            }
            return favorites.count
        } else {
            let favorites = contacts.filter { (contactData) -> Bool in
                return !(contactData.isFavorite ?? true)
            }
            return favorites.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ContactTableViewCell else { return UITableViewCell() }
        
        let contact: ContactData?
        
        if indexPath.section == 0  {
            let favorites = contacts.filter { (contactData) -> Bool in
                return contactData.isFavorite ?? false
            }
            contact = favorites[indexPath.row]
        } else {
            let favorites = contacts.filter { (contactData) -> Bool in
                return !(contactData.isFavorite ?? true)
            }
            contact = favorites[indexPath.row]
        }
        
        cell.nameAndLastNameLabel.text?.sorted()
            
        cell.nameAndLastNameLabel.text = contact?.name
        cell.detailsLabel.text = contact?.companyName
        cell.favoriteStar.image = indexPath.section == 0 ? UIImage.init(systemName: "star.fill"): UIImage.init(systemName: "star")
        
        if let imageURL = URL(string: contact?.smallImageURL ?? "") {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.smallImageView.image = image
                    }
                }
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        rowToshow = contacts[indexPath.row]
        
    }
    
}

