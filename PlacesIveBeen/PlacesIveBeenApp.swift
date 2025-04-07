//
//  PlacesIveBeenApp.swift
//  PlacesIveBeen
//
//  Created by Noah McGuire on 4/7/25.
//

import SwiftUI
import SwiftData

@main
struct PlacesIveBeenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Place.self)
        }
    }
    
    // Will allow us to find where our simulator data is saved:
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
