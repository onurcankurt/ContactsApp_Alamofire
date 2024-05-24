//
//  ContactsDaoRepository.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import Foundation
import RxSwift
import Alamofire

class ContactsDaoRepository {
    var contactsList = BehaviorSubject<[Contact]>(value: [Contact]())
    
    func save(contactName: String, contactPhone: String){
        print("\(contactName) -  \(contactPhone) saved.")
    }
    
    func update(contactID: String, contactName: String, contactPhone: String){
        print("ID: \(contactID) - \(contactName) -  \(contactPhone) updated.")
    }
    
    func delete(contactID: String){
        print("ID: \(contactID) deleted from contacts.")
    }
    
    func search(searchText: String){
        print("Search: \(searchText)")
    }
    
    func uploadContacts(){
        
                
        
//        let c1 = Contact(kisi_id: "1", kisi_ad: "John", kisi_tel: "1111")
//        let c2 = Contact(kisi_id: "2", kisi_ad: "Rick", kisi_tel: "2222")
//        let c3 = Contact(kisi_id: "3", kisi_ad: "Kevin", kisi_tel: "3333")
//        
//        contactsList.append(c1)
//        contactsList.append(c2)
//        contactsList.append(c3)
    }
}
