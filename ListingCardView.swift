//
//  ListingCardView.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


import SwiftUI
import MapKit

struct ListingCardView: View {
    let listing: Listing
    let isFavorite: Bool
    let onFavoriteToggle: () -> Void

    var body: some View {
        HStack {
            MapView(
                address: listing.address,
                coord: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude)
            )
            .frame(width: 90, height: 90)
            .cornerRadius(10)
            .clipped()

            VStack(alignment: .leading, spacing: 6) {
                Text(listing.title)
                    .font(.headline)

                Text("💵 \(listing.rent, format: .currency(code: "USD"))")
                Text("📐 \(listing.sqft) sqft")
            }

            Spacer()

            Button(action: onFavoriteToggle) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .gray)
                    .font(.title3)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 5)
    }
}
