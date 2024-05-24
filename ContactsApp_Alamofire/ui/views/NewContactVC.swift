//
//  NewContactVC.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import UIKit

class NewContactVC: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let kisi_ad = nameTextfield.text, let kisi_tel = phoneTextfield.text{
            print("\(kisi_ad) -  \(kisi_tel) saved.")
        }
    }
}
