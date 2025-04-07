//
//  Place.swift
//  PlacesIveBeen
//
//  Created by Noah McGuire on 4/7/25.
//

import SwiftData

@Model
class Place {
    var city: String
    var country: String
    
    init(city: String = "", country: String = "") {
        self.city = city
        self.country = country
    }
}
extension Place {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        // Add Mock Data
        Task { @MainActor in
        container.mainContext.insert(Place(city: "Boston", country: "USA"))
        container.mainContext.insert(Place(city: "Madrid", country: "Spain"))
        container.mainContext.insert(Place(city: "Cork", country: "Ireland"))
        container.mainContext.insert(Place(city: "Montreal", country: "Canada"))
        }
        return container
    }
}
