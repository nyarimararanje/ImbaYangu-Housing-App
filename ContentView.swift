//
//  ContentView.swift
//  KumbaQuest
//
//  Created by Mararanje, Nyaradzo on
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var locationVM: LocationVM
    @Query private var listings: [Listing]
    @State private var showAddListingView = false
    @State private var favoriteIDs = Set<UUID>()

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(listings) { listing in
                    NavigationLink(destination: PlaceDetailView(listing: listing)) {
                        ListingCardView(listing: listing, isFavorite: favoriteIDs.contains(listing.uuid)) {
                            toggleFavorite(for: listing)
                        }
                    }
                }
                .onDelete(perform: deleteListings)
            }
            .navigationTitle("KumbaQuest")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showAddListingView = true
                    }) {
                        Label("Post Home", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Choose a home to view details")
                .foregroundColor(.secondary)
        }
        .sheet(isPresented: $showAddListingView) {
            AddListingView { newListing in
                modelContext.insert(newListing)
                showAddListingView = false
            }
        }
    }

    private func toggleFavorite(for listing: Listing) {
        if favoriteIDs.contains(listing.uuid) {
            favoriteIDs.remove(listing.uuid)
        } else {
            favoriteIDs.insert(listing.uuid)
        }
    }

    private func deleteListings(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(listings[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Listing.self, inMemory: true)
}
