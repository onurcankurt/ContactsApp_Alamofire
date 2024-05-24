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
        let params: Parameters = ["kisi_ad": contactName, "kisi_tel": contactPhone]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data{
                do {
                    let responseJSON = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Message : \(responseJSON.message!)")
                    print("Success : \(responseJSON.success!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func update(contactID: String, contactName: String, contactPhone: String){
        let params: Parameters = ["kisi_id": contactID, "kisi_ad": contactName, "kisi_tel": contactPhone]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let responseJSON = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Message : \(responseJSON.message!)")
                    print("Success : \(responseJSON.success!)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(contactID: String){
        let params: Parameters = ["kisi_id": contactID]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data{
                do{
                    let responseJSON = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Message: \(responseJSON.message!)")
                    print("Success: \(responseJSON.success!)")
                    self.uploadContacts()
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func search(searchText: String){
        let params: Parameters = ["kisi_ad": searchText]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            if let data = response.data{
                do {
                    let responseJSON = try JSONDecoder().decode(ContactsResponse.self, from: data)
                    if let list = responseJSON.kisiler{
                        self.contactsList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadContacts(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            if let data = response.data{
                do {
                    let responseJSON = try JSONDecoder().decode(ContactsResponse.self, from: data)
                    if let list = responseJSON.kisiler{
                        self.contactsList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
