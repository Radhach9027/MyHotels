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
        return [
            Place(
                id: "charminar",
                name: "Charminar",
                category: "Landmark",
                coordinate: .init(latitude: 17.3616, longitude: 78.4747),
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Charminar%20in%20April%202024%20p1.jpg"),
                rating: 4.7, reviewsCount: 12034,
                summary: "Iconic 16th-century monument with buzzing bazaars."
            ),
            Place(
                id: "hussain-sagar",
                name: "Hussain Sagar – Buddha Statue",
                category: "Lakefront",
                coordinate: .init(latitude: 17.4239, longitude: 78.4738),
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Buddha%20statue%20at%20Hussain%20Sagar%20in%20Hyderabad.jpg"),
                rating: 4.5, reviewsCount: 8420,
                summary: "Promenade vibes, boat rides, and sunset views."
            ),
            Place(
                id: "golconda",
                name: "Golconda Fort",
                category: "Fort",
                coordinate: .init(latitude: 17.3833, longitude: 78.4011),
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Golconda%20Fort%20008.jpg"),
                rating: 4.6, reviewsCount: 15210,
                summary: "Majestic fort with acoustic marvels and city panoramas."
            ),
            Place(
                id: "ramoji",
                name: "Ramoji Film City",
                category: "Studio Park",
                coordinate: .init(latitude: 17.2543, longitude: 78.6814),
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Ramoji%20Film%20City.jpg"),
                rating: 4.4, reviewsCount: 19020,
                summary: "Massive film studio complex with themed tours."
            ),
            Place(
                id: "salar-jung",
                name: "Salar Jung Museum",
                category: "Museum",
                coordinate: .init(latitude: 17.3713, longitude: 78.4804),
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Salar%20Jung%20Museum%20153.jpg"),
                rating: 4.6, reviewsCount: 21030,
                summary: "World-class art & artifacts spanning continents."
            )
        ]
    }

}

