//
//  ViewModel.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 17/11/23.
//

// ContactViewModel.swift

import Foundation

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []

    init() {
        // Add some sample contacts
        contacts.append(Contact(name: "John Doe", phoneNumber: "123-456-7890", email: "john@gmail.com"))
        contacts.append(Contact(name: "Jane Doe", phoneNumber: "987-654-3210", email: "jane@outlook.com"))
        contacts.append(Contact(name: "Bob Smith", phoneNumber: "555-123-4567", email: "bob@yahoo.com"))
        contacts.append(Contact(name: "Hasan", phoneNumber: "555-658-3298", email: "Hasan@hotmail.com"))
        contacts.append(Contact(name: "Hosein", phoneNumber: "555-853-2596", email: "Hosein@hotmail.com"))
        contacts.append(Contact(name: "Behrouz", phoneNumber: "273-263-7890", email: "Behrouz@gmail.com"))
        contacts.append(Contact(name: "Ali Shafiei", phoneNumber: "302-761-2134", email: "Ali@yahoo.com"))
        contacts.append(Contact(name: "Dr. Torrini", phoneNumber: "422-867-5212", email: "DrTorrini@gmail.com"))
        contacts.append(Contact(name: "Sorena", phoneNumber: "888-671-7621", email: "Asghar@gmail.com"))
        contacts.append(Contact(name: "Alexander", phoneNumber: "555-185-2790", email: "Alexander@outlook.com"))
        contacts.append(Contact(name: "Reza", phoneNumber: "864-378-0093", email: "Reza@gmail.com"))
        contacts.append(Contact(name: "Khalse", phoneNumber: "843-444-2121", email: "Khalse@hotmail.com"))
        contacts.append(Contact(name: "Abbas", phoneNumber: "932-861-1679", email: "Abbas@gmail.com"))
        contacts.append(Contact(name: "Koskesh", phoneNumber: "130-853-3781", email: "Koskesh@outlook.com"))
        contacts.append(Contact(name: "Sahand", phoneNumber: "+393518312136", email: "Sahand@yahoo.com"))
        contacts.append(Contact(name: "TheRock", phoneNumber: "854-332-9090", email: "TheRock@yahoo.com"))
        contacts.append(Contact(name: "Carl Johnson", phoneNumber: "709-634-4444", email: "Carl Johnson@hotmail.com"))
        contacts.append(Contact(name: "Hotel", phoneNumber: "909-999-6322", email: "Hotel@hotmail.com"))
        contacts.append(Contact(name: "Saghi", phoneNumber: "+98991281690", email: "Saghi@gmail.com"))
        contacts.append(Contact(name: "Ymir", phoneNumber: "538-642-2790", email: "Ymir@KiramToJomhoriEslami.com"))
    }
}

