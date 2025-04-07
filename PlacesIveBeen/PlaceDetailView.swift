//
//  PlaceDetailView.swift
//  PlacesIveBeen
//
//  Created by Noah McGuire on 4/7/25.
//

import SwiftUI
import SwiftData

struct PlaceDetailView: View {
    @State var place: Place
    @State private var city = ""
    @State private var country = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("City:")
                .font(.title)
                .bold()
            TextField("city", text: $city)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .padding(.bottom)
            
            Text("Country:")
                .font(.title)
                .bold()
            TextField("country", text: $country)
                .textFieldStyle(.roundedBorder)
                .font(.title)
            Spacer()
        }
        .padding(.horizontal)
        .onAppear() {
            // Move data from toDo object to local vars
            city = place.city
            country = place.country
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    place.city = city
                    place.country = country
                    modelContext.insert(place)
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save on PlaceDetailView did not work.")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PlaceDetailView(place: Place(city: "Galapagos", country: "Ecuador"))
            .modelContainer(for: Place.self, inMemory: true)
    }
}
