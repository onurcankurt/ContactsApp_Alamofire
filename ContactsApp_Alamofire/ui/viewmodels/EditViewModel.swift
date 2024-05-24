//
//  EditViewModel.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import Foundation

class EditViewModel {
    var crepo = ContactsDaoRepository()
    
    func update(contactID: String, contactName: String, contactPhone: String){
        crepo.update(contactID: contactID, contactName: contactName, contactPhone: contactPhone)
    }
}
