//
//  PlaceRowView.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 22/10/25.
//
import SwiftUI
import CoreLocation
import MapKit

struct PlaceRow: View {
    let place: Place
    let currentLocation: CLLocation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(place.name)
                        .font(.headline)
                        .lineLimit(1)
                    HStack(spacing: 6) {
                        Label(place.category, systemImage: "mappin.and.ellipse")
                            .labelStyle(.titleAndIcon)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text("•")
                            .foregroundStyle(.secondary)
                        StarRatingView(rating: place.rating)
                        Text("(\(place.reviewsCount.formatted()))")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 4) {
                    Image(systemName: "location.circle")
                        .imageScale(.medium)
                    Text(distanceString(from: currentLocation, to: place.clLocation))
                        .font(.subheadline.weight(.semibold))
                }
                .accessibilityLabel("Distance \(distanceString(from: currentLocation, to: place.clLocation))")
            }
            
            // Preview image
            AsyncImage(url: place.imageURL) { phase in
                switch phase {
                case .empty:
                    ZStack { RoundedRectangle(cornerRadius: 14).fill(.thinMaterial); ProgressView() }
                        .frame(height: 140)
                case .success(let img):
                    img.resizable().scaledToFill()
                        .frame(height: 140)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                case .failure:
                    ZStack {
                        RoundedRectangle(cornerRadius: 14).fill(Color(.secondarySystemBackground))
                        Image(systemName: "photo").imageScale(.large).foregroundStyle(.secondary)
                    }
                    .frame(height: 140)
                @unknown default:
                    Color.secondary.frame(height: 140).clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            
            Text(place.summary)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
            
            HStack(spacing: 10) {
                Button {
                    openInMaps(destination: place)
                } label: {
                    Label("Directions", systemImage: "arrow.triangle.turn.up.right.circle.fill")
                        .font(.subheadline.weight(.semibold))
                }
                .buttonStyle(.bordered)
                
                Button {
                    print("Book Now tapped for \(place.name)")
                } label: {
                    Text("Book Now")
                        .font(.subheadline.weight(.semibold))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(14)
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
    
    private func distanceString(from a: CLLocation, to b: CLLocation) -> String {
        let meters = a.distance(from: b)
        if meters < 1000 {
            return "\(Int(meters)) m"
        } else {
            let km = meters / 1000.0
            return String(format: "%.1f km", km)
        }
    }
    
    private func openInMaps(destination: Place) {
        let placemark = MKPlacemark(coordinate: destination.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = destination.name
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ])
    }
}
