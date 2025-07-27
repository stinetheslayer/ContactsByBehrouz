//
//  Contact.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 17/11/23.
//

// Contact.swift

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
    var email: String
}
