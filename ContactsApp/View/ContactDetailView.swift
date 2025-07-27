//
//  ContactDetailView.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 17/11/23.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: Contact

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)

            Text(contact.name)
                .font(.title)
                .fontWeight(.bold)

            Divider()

            HStack {
                Image(systemName: "phone.fill")
                    .foregroundColor(.blue)
                Text(contact.phoneNumber)
            }

            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                Text(contact.email)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(contact.name)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "John Doe", phoneNumber: "123-456-7890", email: "john@gmail.com"))
    }
}
