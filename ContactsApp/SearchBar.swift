//
//  SearchBar.swift
//  ContactsApp
//
//  Created by Homayoun Salimi Manjili on 20/11/23.
//

// SearchBar.swift

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.trailing, 8)
            
            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText.isEmpty ? 0 : 1)
            }
            .padding(.trailing, 8)
            .foregroundColor(Color(.systemGray2))
        }
        .padding(.horizontal)
    }
}
