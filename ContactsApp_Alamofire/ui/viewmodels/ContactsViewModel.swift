//
//  ContactsViewModel.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import Foundation
import RxSwift

class ContactsViewModel {
    var crepo = ContactsDaoRepository()
    var contactsList = BehaviorSubject<[Contact]>(value: [Contact]())
    
    init() {
        contactsList = crepo.contactsList
        uploadContacts()
    }
    
    func delete(contactID: String){
        crepo.delete(contactID: contactID)
    }
    
    func search(searchText: String){
        crepo.search(searchText: searchText)
    }
    
    func uploadContacts(){
        crepo.uploadContacts()
    }
}
