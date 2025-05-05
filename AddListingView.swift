//
//  AddListingView.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


import SwiftUI

struct AddListingView: View {
    @Environment(\.dismiss) private var dismiss
    var onSave: (Listing) -> Void

    @State private var title = ""
    @State private var rent = ""
    @State private var sqft = ""
    @State private var address = ""
    @State private var latitude = ""
    @State private var longitude = ""
    @State private var notes = ""
    @State private var phoneNumber = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Listing Info")) {
                    TextField("Title", text: $title)
                    TextField("Rent", text: $rent)
                        .keyboardType(.decimalPad)
                    TextField("Sqft", text: $sqft)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Location")) {
                    TextField("Address", text: $address)
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Extra")) {
                    TextField("Notes", text: $notes)
                    TextField("Phone", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("Add a New Listing")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newListing = Listing(
                            title: title,
                            rent: Double(rent) ?? 0.0,
                            sqft: Int(sqft) ?? 0,
                            address: address,
                            latitude: Double(latitude) ?? 0.0,
                            longitude: Double(longitude) ?? 0.0,
                            notes: notes,
                            phoneNumber: phoneNumber
                        )
                        onSave(newListing)
                        dismiss()
                    }
                    .disabled(title.isEmpty || rent.isEmpty || sqft.isEmpty)
                }
            }
        }
    }
}
