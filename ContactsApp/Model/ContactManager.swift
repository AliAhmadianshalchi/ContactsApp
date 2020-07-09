//
//  ContactManager.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import Foundation

protocol ContactManagerDelegate {
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactModel)
    func didFailWithError(error: Error)
}

struct ContactManager {
    
    let ContactUrl = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json"
       
       var delegate: ContactManagerDelegate?
    
    
       func performRequest(with urlString: String) {
           if let url = URL(string: urlString) {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error != nil {
                       self.delegate?.didFailWithError(error: error!)
                       return
                   }
                   if let safeData = data {
                       if let contact = self.parseJSON(safeData) {
                           self.delegate?.didUpdateContact(self, contact: contact)
                       }
                   }
               }
               task.resume()
           }
       }
    
       
       func parseJSON(_ contactData: Data) -> ContactModel? {
           let decoder = JSONDecoder()
           do {
                let decodedData = try decoder.decode(ContactData.self, from: contactData)
                let name = decodedData.name
                let id = decodedData.id
                let companyName = decodedData.companyName
                let isFavorite = decodedData.isFavorite
                let smallImageURL = decodedData.smallImageURL
                let largeImageURL = decodedData.largeImageURL
                let emailAddress = decodedData.emailAddress
                let birthdate = decodedData.birthdate
            
                let workPhone = decodedData.phone.work
                let homePhone = decodedData.phone.home
                let mobilePhone = decodedData.phone.mobile
            
                let street = decodedData.address.street
                let city = decodedData.address.city
                let state = decodedData.address.state
                let country = decodedData.address.country
                let zipCode = decodedData.address.zipCode
               
               let contact = ContactModel(name: name, id: id, companyName: companyName, isFavorite: isFavorite, smallImageURL: smallImageURL, largeImageURL: largeImageURL, emailAddress: emailAddress, birthdate: birthdate, work: workPhone, home: homePhone, mobile: mobilePhone, street: street, city: city, state: state, country: country, zipCode: zipCode)
               return contact
           } catch {
               delegate?.didFailWithError(error: error)
               return nil
           }
       }
}
