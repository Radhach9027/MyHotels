//
//  NearbySectionView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI
import CoreLocation

struct NearbySectionView: View {
    @StateObject private var vm = NearbyPlacesViewModel()
    private let currentLocation = CLLocation(latitude: 17.4474, longitude: 78.3762)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Near You")
                .font(.title2).bold()
                .padding(.horizontal)
            
            Group {
                switch vm.state {
                case .idle, .loading:
                    VStack(spacing: 12) {
                        ForEach(0..<3, id: \.self) { _ in ShimmerPlaceRow() }
                    }
                    .padding(.horizontal)
                case .failed:
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("Failed to load nearby places.")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                case .loaded(let places):
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(placesSorted(places)) { place in
                                PlaceRow(place: place, currentLocation: currentLocation)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 4)
                    }
                    .contentMargins(.vertical, 0)
                }
            }
        }
        .onAppear { if case .idle = vm.state { vm.load(from: currentLocation) } }
        .refreshable { vm.load(from: currentLocation) }
    }
    
    private func placesSorted(_ items: [Place]) -> [Place] {
        items.sorted {
            CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
                .distance(from: currentLocation)
            <
            CLLocation(latitude: $1.coordinate.latitude, longitude: $1.coordinate.longitude)
                .distance(from: currentLocation)
        }
    }
}
