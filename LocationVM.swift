//
//  LocationVM.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//


import Foundation
import CoreLocation
import MapKit

@MainActor
class LocationVM: NSObject, ObservableObject {
    @Published var location: CLLocationCoordinate2D?

    private var locationManager = CLLocationManager()

    func start() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func stop() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationVM: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            location = coordinate
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
}
