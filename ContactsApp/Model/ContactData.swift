//
//  ContactData.swift
//  ContactsApp
//
//  Created by Ali Ahmadian shalchi on 06/07/2020.
//  Copyright © 2020 Ali Ahmadian shalchi. All rights reserved.
//

import Foundation

struct ContactData: Codable {
    
    let name: String?
    let id: String
    let companyName: String?
    let isFavorite: Bool?
    let smallImageURL: String?
    let largeImageURL: String?
    let emailAddress: String?
    let birthdate: String?
    
    let phone: Phone?
    let address: Address?
    
}

struct Phone: Codable {
    let work: String?
    let home: String?
    let mobile: String?
}

struct Address: Codable {
    let street: String?
    let city: String?
    let state: String?
    let country: String?
    let zipCode: String?
}
