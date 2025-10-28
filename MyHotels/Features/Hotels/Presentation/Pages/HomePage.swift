//
//  ContentView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import SwiftUI

struct HomePage: View {
    @StateObject private var hotelsVM = HotelsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {

                    StayTypeSelectionView { params in
                        switch params.type {
                        case .hourly:
                            print("Hourly: \(params.hours!)h starting at…")
                        case .night:
                            print("Night: \(params.checkIn!) → \(params.checkOut!)")
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    HStack {
                        Text("Popular Hotels Nearby")
                            .font(.title3).bold()
                        Spacer()
                        Button {
                            hotelsVM.load()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .font(.body)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal)

                    HotelCarousel(viewModel: hotelsVM)
                    NearbySectionView()
                }
                .padding(.bottom, 32) // space above bottom bar
            }
            .background(Color(.systemGroupedBackground))
            .onAppear {
                if case .idle = hotelsVM.state {
                    hotelsVM.load()
                }
            }
            .navigationTitle("Hotels")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct HotelCarousel: View {
    @ObservedObject var viewModel: HotelsViewModel

    var body: some View {
        switch viewModel.state {
        case .idle, .loading:
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<3, id: \.self) { _ in
                        ShimmerHotelCard()
                            .frame(width: 270, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal, 16)
            }

        case .failed:
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                Text("Failed to load hotels")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Button("Retry") {
                    viewModel.load()
                }
                .buttonStyle(.bordered)
                .padding(.top, 6)
            }
            .frame(maxWidth: .infinity)

        case .loaded(let hotels):
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(hotels) { hotel in
                        HotelCard(hotel: hotel) {
                            print("Book Now tapped for \(hotel.name)")
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

