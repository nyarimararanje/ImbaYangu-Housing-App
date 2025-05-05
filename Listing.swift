//
//  Listing.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


import Foundation
import SwiftData

@Model
class Listing: Identifiable {
    var uuid: UUID
    var title: String
    var rent: Double
    var sqft: Int
    var address: String
    var latitude: Double
    var longitude: Double
    var notes: String
    var phoneNumber: String

    init(title: String, rent: Double, sqft: Int, address: String, latitude: Double, longitude: Double, notes: String, phoneNumber: String) {
        self.uuid = UUID()
        self.title = title
        self.rent = rent
        self.sqft = sqft
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.notes = notes
        self.phoneNumber = phoneNumber
    }
}
