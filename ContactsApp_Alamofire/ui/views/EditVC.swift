//
//  EditVC.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import UIKit

class EditVC: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    var editContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = editContact{
            nameTextfield.text = c.kisi_ad
            phoneTextfield.text = c.kisi_tel
        }
    }
    @IBAction func updateButton(_ sender: Any) {
        if let kisi_id = editContact!.kisi_id, let kisi_ad = nameTextfield.text, let kisi_tel = phoneTextfield.text{
            print("ID: \(kisi_id) - \(kisi_ad) -  \(kisi_tel) updated.")
        }
    }
}
