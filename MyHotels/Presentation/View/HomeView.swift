//
//  ContentView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import SwiftUI


struct HomeView: View {
    @StateObject private var hotelsVM = HotelsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Top Hotels")
                .font(.title2).bold()
                .padding(.horizontal)
            
            Group {
                switch hotelsVM.state {
                case .idle, .loading:
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<3, id: \.self) { _ in
                                ShimmerHotelCard()
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 2)
                    }
                case .failed:
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("Failed to load hotels. Pull to retry.")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                case .loaded(let hotels):
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(hotels) { hotel in
                                HotelCard(hotel: hotel) {
                                    print("Book Now tapped for \(hotel.name)")
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 2)
                    }
                    .scrollTargetBehavior(.paging)
                }
            }
            NearbySectionView()
        }
        .padding(.top, 8)
        .onAppear { if case .idle = hotelsVM.state { hotelsVM.load() } }
        .refreshable { hotelsVM.load() }
    }
}

#Preview {
    HomeView()
}
