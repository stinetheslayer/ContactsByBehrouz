//
//  ContentView.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 17/11/23.
//

// ContentView.swift

// ContentView.swift

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContactViewModel()
    @State private var searchText = ""
    @State private var isAddingContact = false
    @State private var isCreatingGroup = false

    var body: some View {
        NavigationView {
            List {
                // My Card section
                Section(header: Text("My Card")) {
                    // Display the user's own contact information here
                    Text("Homayoun Salimi Manjili")
                }

                // Other sections for alphabetical contacts
                ForEach(alphabeticalSections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.contacts) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                Text(contact.name)
                                    .contextMenu {
                                        Button("Message", systemImage: "message") {
                                            // Implement your messaging logic here
                                        }
                                        Button("Call", systemImage: "phone") {
                                            // Implement your calling logic here
                                        }
                                        Button("Video", systemImage: "video") {
                                            // Implement your video call logic here
                                        }
                                        Button("Copy", systemImage: "doc.on.doc") {
                                            // Implement your copying logic here
                                        }
                                        Button("Share", systemImage: "square.and.arrow.up") {
                                            // Implement your sharing logic here
                                        }
                                        Button("Make This My Card", systemImage: "person.crop.circle.badge.plus") {
                                            // Implement logic to make this contact your card
                                        }
                                        Button("Delete Contact", systemImage: "trash") {
                                            deleteContact(contact)
                                        }
                                        
                                    }
                            }
                        }
                        .onDelete { indexSet in
                            // Handle deletion of contacts
                            deleteContacts(at: indexSet, section: section)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Contacts")
            .navigationBarItems(
                leading: Button(action: {
                    // Action to open sheet or navigate to a new view for creating a group
                    isCreatingGroup.toggle()
                }) {
                    Image(systemName: "square.stack.fill") // Change the icon to a list
                        .imageScale(.large)
                        .padding()
                },
                trailing: Button(action: {
                    // Action to toggle the sheet for adding a new contact
                    isAddingContact.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddingContact) {
                AddContactView(viewModel: viewModel, isAddingContact: $isAddingContact)
            }
            .sheet(isPresented: $isCreatingGroup) {
                // Add a sheet or navigate to a new view for creating a group
                // Replace the following with your actual implementation
                Text("Create Group View")
            }
            .searchable(text: $searchText) {
                ForEach(filteredContacts) { contact in
                    Text(contact.name)
                }
            }
            .background(Color.white)
        }
    }

    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return viewModel.contacts
        } else {
            return viewModel.contacts.filter { contact in
                contact.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var alphabeticalSections: [AlphabeticalSection] {
        let sortedContacts = filteredContacts.sorted { $0.name < $1.name }
        let groupedContacts = Dictionary(grouping: sortedContacts) { String($0.name.first ?? Character("")).uppercased() }

        return groupedContacts
            .map { key, value in
                AlphabeticalSection(title: key, contacts: value)
            }
            .sorted { $0.title < $1.title }
    }

    private func deleteContacts(at offsets: IndexSet, section: AlphabeticalSection) {
        viewModel.contacts.removeAll { contact in
            let deletedContact = section.contacts[offsets.first!]
            return contact.id == deletedContact.id
        }
    }

    private func deleteContact(_ contact: Contact) {
        // Implement logic to delete the contact
    }
}

struct AlphabeticalSection: Identifiable {
    var id: String { title }
    let title: String
    let contacts: [Contact]
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





