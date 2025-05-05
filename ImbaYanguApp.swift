//
//  ImbaYanguApp.swift
//  ImbaYangu
//
//  Created by Nyaradzo Mararanje on 5/5/25.
//

import SwiftUI

@main
struct ImbaYanguApp: App {
    @StateObject private var locationVM = LocationVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationVM)
        }
    }
}
