//
//  PlaceListView.swift
//  PlacesIveBeen
//
//  Created by Noah McGuire on 4/7/25.
//

import SwiftUI
import SwiftData
struct PlaceListView: View {
    @Query var places: [Place]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(places) { place in
                    NavigationLink {
                        PlaceDetailView(place: place)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(place.city)
                                .font(.title)
                            Text(place.country)
                                .font(.title2)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(place)
                            guard let _ = try? modelContext.save() else {
                                print("ERROR: Save after .delete did not work")
                                return
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Places I've Been:")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack {
                PlaceDetailView(place: Place())
            }
        }
    }
}

#Preview {
    PlaceListView()
        .modelContainer(Place.preview)
}
