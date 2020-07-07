//
//  ViewController.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ listTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactTableViewCell else { return UITableViewCell() }
//        cell.setup(laptops[indexPath.row])
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

//extension ContactsViewController: UITableViewDelegate, UITableViewDataSource  {
//    
//    func tableView(_ listTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return 2
//        }
//        
//        func tableView(_ listTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            guard let cell = listTableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListTableViewCell else { return UITableViewCell() }
//            cell.setup(laptops[indexPath.row])
//            
//            return cell
//        }
//        
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    //        performSegue(withIdentifier: "showDetails", sender: self)
//            rowToshow = laptops[indexPath.row]
//        }
//    
//}

