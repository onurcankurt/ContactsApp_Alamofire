//
//  ViewController.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import UIKit

class ContactsVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactsList = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let c1 = Contact(kisi_id: "1", kisi_ad: "John", kisi_tel: "1111")
        let c2 = Contact(kisi_id: "2", kisi_ad: "Rick", kisi_tel: "2222")
        let c3 = Contact(kisi_id: "3", kisi_ad: "Kevin", kisi_tel: "3333")
        
        contactsList.append(c1)
        contactsList.append(c2)
        contactsList.append(c3)
    }
}

extension ContactsVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search: \(searchText)")
    }
    
}

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell") as! ContactsCell
        
        cell.nameLabel.text = contact.kisi_ad
        cell.phoneLabel.text = contact.kisi_tel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactsList[indexPath.row]
        performSegue(withIdentifier: "toEditVC", sender: contact)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditVC"{
            if let senderContact = sender as? Contact{
                let destinationVC = segue.destination as! EditVC
                destinationVC.editContact = senderContact
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contact = contactsList[indexPath.row]
        let deleteSwapAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAtion, view, bool in
            let deleteAlert = UIAlertController(title: "Delete", message: "Do you want to delete \(contact.kisi_ad!)", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { alert in
                print("ID: \(contact.kisi_id!) deleted from contacts.")
            }
            deleteAlert.addAction(cancelAction)
            deleteAlert.addAction(yesAction)
            self.present(deleteAlert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteSwapAction])
    }
}

