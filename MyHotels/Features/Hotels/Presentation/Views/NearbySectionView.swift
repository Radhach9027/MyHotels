//
//  NearbySectionView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI
import CoreLocation

struct NearbySectionView: View {
    @StateObject var vm = NearbyPlacesViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Nearby Attractions")
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
                            ForEach(vm.placesSorted(places)) { place in
                                PlaceRow(place: place, distance: vm.distanceString(from: vm.currentLocation, to: place.clLocation))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 4)
                    }
                    .contentMargins(.vertical, 0)
                }
            }
        }
        .onAppear { if case .idle = vm.state { vm.load(from: vm.currentLocation) } }
        .refreshable { vm.load(from: vm.currentLocation) }
    }
}
