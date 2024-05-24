//
//  ContactsResponse.swift
//  ContactsApp_Alamofire
//
//  Created by onur on 24.05.2024.
//

import Foundation

class ContactsResponse: Codable {
    var kisiler: [Contact]?
    var success: Int?
}
