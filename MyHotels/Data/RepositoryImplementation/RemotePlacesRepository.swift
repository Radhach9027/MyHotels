//
//  RemotePlacesRepository.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation
import NetworkClient
import DependencyContainer

struct RemotePlacesRepository: PlacesRepository {
    @Inject private var client: TraditionalNetworkProtocol
    
    func nearbyPlaces(from: CLLocation, radiusMeters: Int) async throws -> [Place] {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        return [
            Place(id: "charminar", name: "Charminar Bazaar", category: "Landmark",
                  coordinate: .init(latitude: 17.3616, longitude: 78.4747),
                  imageURL: URL(string: "https://images.unsplash.com/photo-1596178060671-c9e8f5f2ddca?q=80&w=1600&auto=format&fit=crop"),
                  rating: 4.7, reviewsCount: 12034,
                  summary: "Historic monument with vibrant markets and iconic arches."),
            Place(id: "hussain-sagar", name: "Hussain Sagar Lake", category: "Lakefront",
                  coordinate: .init(latitude: 17.4239, longitude: 78.4738),
                  imageURL: URL(string: "https://images.unsplash.com/photo-1587300003388-59208cc962cb?q=80&w=1600&auto=format&fit=crop"),
                  rating: 4.5, reviewsCount: 8420,
                  summary: "Promenade, boat rides, and sunset views over the Buddha statue."),
            Place(id: "golconda", name: "Golconda Fort", category: "Fort",
                  coordinate: .init(latitude: 17.3833, longitude: 78.4011),
                  imageURL: URL(string: "https://images.unsplash.com/photo-1560969184-10fe8719e047?q=80&w=1600&auto=format&fit=crop"),
                  rating: 4.6, reviewsCount: 15210,
                  summary: "Majestic fort with acoustic marvels and evening light show.")
        ]
    }
}

