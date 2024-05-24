//
//  NewContactViewModel.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import Foundation

class NewContactViewModel {
    var crepo = ContactsDaoRepository()
    
    func save(contactName: String, contactPhone: String){
        crepo.save(contactName: contactName, contactPhone: contactPhone)
    }
}
