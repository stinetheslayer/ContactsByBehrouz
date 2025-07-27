//
//  AddContactView.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 20/11/23.
//

// AddContactView.swift

import SwiftUI

struct AddContactView: View {
    @ObservedObject var viewModel: ContactViewModel
    @Binding var isAddingContact: Bool
    @State private var newName = ""
    @State private var newPhoneNumber = ""
    @State private var newEmail = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Contact Information")) {
                    TextField("Name", text: $newName)
                        .textContentType(.name)
                        .keyboardType(.default)
                    
                    TextField("Phone Number", text: $newPhoneNumber)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                    
                    TextField("Email", text: $newEmail)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Contact")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isAddingContact = false
                },
                trailing: Button("Save") {
                    let newContact = Contact(name: newName, phoneNumber: newPhoneNumber, email: newEmail)
                    viewModel.contacts.append(newContact)
                    isAddingContact = false
                }
            )
        }
    }
}


