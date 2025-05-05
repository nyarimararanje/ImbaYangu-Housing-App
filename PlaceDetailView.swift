//
//  PlaceDetailView.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


import SwiftUI
import MapKit

struct PlaceDetailView: View {
    let listing: Listing

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                MapView(
                    address: listing.address,
                    coord: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
                    showMarker: true
                )
                .frame(height: 250)
                .cornerRadius(12)

                Group {
                    Text(listing.title)
                        .font(.title)
                        .bold()

                    Text("💵 Rent: \(listing.rent, format: .currency(code: "USD"))")
                    Text("📐 Size: \(listing.sqft) sqft")
                    Text("📍 Address: \(listing.address)")
                    Text("📝 Notes: \(listing.notes)")
                    Text("📞 Contact: \(listing.phoneNumber)")
                }
                .font(.body)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Listing Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
