//
//  EditContactView.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 23/11/23.
//

// EditContactView.swift

import SwiftUI

struct EditContactView: View {
    @Binding var contact: Contact
    @Binding var isEditing: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Information")) {
                    TextField("Name", text: $contact.name)
                        .textContentType(.name)
                        .keyboardType(.default)

                    TextField("Phone Number", text: $contact.phoneNumber)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)

                    TextField("Email", text: $contact.email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                }
            }
            .navigationBarTitle("Edit Contact")
            .navigationBarItems(trailing:
                Button(action: {
                    isEditing = false
                }) {
                    Text("Save")
                        .font(.body)
                }
            )
        }
    }
}
