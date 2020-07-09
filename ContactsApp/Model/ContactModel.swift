//
//  ContactModel.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import Foundation

struct ContactModel {
   
    let name: String
    let id: String
    let companyName: String
    let isFavorite: Bool
    let smallImageURL: String
    let largeImageURL: String
    let emailAddress: String
    let birthdate: String
    
    let work: String
    let home: String
    let mobile: String
    
    let street: String
    let city: String
    let state: String
    let country: String
    let zipCode: String
    
    init(name: String , id: String , companyName: String , isFavorite: Bool , smallImageURL: String , largeImageURL: String , emailAddress: String , birthdate: String , work: String , home: String , mobile: String , street: String , city: String , state: String , country: String , zipCode: String) {
        
        self.name = name
        self.id = id
        self.companyName = companyName
        self.isFavorite = isFavorite
        self.smallImageURL = smallImageURL
        self.largeImageURL = largeImageURL
        self.emailAddress = emailAddress
        self.birthdate = birthdate
        self.work = work
        self.home = home
        self.mobile = mobile
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.zipCode = zipCode
        
    }
    
    
    
}
