//
//  MapView.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


//
//  MapView.swift
//
//  Created by Arthur Roolfs on 10/17/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var address: String
    var coord: CLLocationCoordinate2D
    var showMarker = false
    
    var body: some View {
        Map(initialPosition: .region(MKCoordinateRegion(
            center: coord,
            latitudinalMeters: 500,
            longitudinalMeters: 500))) {
                if showMarker {
                    UserAnnotation()
                    Marker(address, coordinate: coord)
                }
            }
    }
}

#Preview {
    MapView(
        address: "123 Elmgove",
        coord: CLLocationCoordinate2D(latitude: 43.16103, longitude: -77.6109219),
        showMarker: true
    )
}
