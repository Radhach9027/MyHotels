//
//  HotelCardView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//

import SwiftUI

struct HotelCard: View {
    let hotel: Hotel
    var onBookNow: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: hotel.imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView().frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.secondary)
                    @unknown default:
                        Color.secondary
                    }
                }
                .frame(height: 130)
                .clipped()
                .overlay(LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.45)]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(hotel.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .shadow(radius: 2)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "mappin.and.ellipse")
                            .imageScale(.small)
                        Text(hotel.city)
                    }
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.9))
                }
                .padding(12)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                    StarRatingView(rating: hotel.rating)
                        .accessibilityLabel("\(String(format: "%.1f", hotel.rating)) star rating")
                    Text("(\(hotel.reviewsCount.formatted()))")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Spacer()

                    VStack(alignment: .trailing, spacing: 2) {
                        Text("₹\(hotel.pricePerNight.formatted())")
                            .font(.subheadline.bold())
                        Text("per night")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Text(hotel.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Button {
                        onBookNow()
                    } label: {
                        Text("Book Now")
                            .font(.subheadline.weight(.semibold))
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                    } label: {
                        Image(systemName: "heart")
                            .font(.body.weight(.semibold))
                            .padding(10)
                    }
                    .buttonStyle(.bordered)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .accessibilityLabel("Add to wishlist")
                }
            }
            .padding(14)
        }
        .frame(width: 280)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(Color.primary.opacity(0.06))
        )
        .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 4)
        .accessibilityElement(children: .combine)
    }
}
