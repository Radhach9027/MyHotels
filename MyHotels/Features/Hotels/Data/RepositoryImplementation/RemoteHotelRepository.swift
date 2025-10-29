//
//  RemoteHotelRepository.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import DependencyContainer
import NetworkClient

struct RemoteHotelRepository: HotelRepository {
   @Inject private var client: TraditionalNetworkProtocol
    
    func topHotels() async throws -> [Hotel] {
        [
            Hotel(
                id: "taj-falaknuma-palace",
                name: "Taj Falaknuma Palace",
                city: "Hyderabad, India",
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Taj%20Falaknuma%20Palace.jpg"),
                description: "Iconic hilltop palace hotel with grand durbar halls, heritage dining, and panoramic city views.",
                rating: 4.8,
                reviewsCount: 2500,
                pricePerNight: 24500
            ),
            Hotel(
                id: "itc-kohenur",
                name: "ITC Kohenur, a Luxury Collection Hotel",
                city: "Hyderabad, India",
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/ITC%20Kohenur%20Hyderabad%20India.jpg"),
                description: "Contemporary luxury overlooking Durgam Cheruvu, with fine dining and spa in HITEC City.",
                rating: 4.7,
                reviewsCount: 3100,
                pricePerNight: 12000
            ),
            Hotel(
                id: "park-hyatt-hyderabad",
                name: "Park Hyatt Hyderabad",
                city: "Hyderabad, India",
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Park%20Hyatt%20Hyderabad.jpg"),
                description: "Elegant Banjara Hills address known for its atrium lobby, refined rooms, and upscale restaurants.",
                rating: 4.6,
                reviewsCount: 4200,
                pricePerNight: 13500
            ),
            Hotel(
                id: "novotel-hyderabad-airport",
                name: "Novotel Hyderabad Airport",
                city: "Hyderabad, India",
                imageURL: URL(string: "https://commons.wikimedia.org/wiki/Special:FilePath/Novotel%20Hyderabad%20Airport%20Exterior.jpg"),
                description: "Convenient airport hotel with resort-style pool, fitness facilities, and all-day dining.",
                rating: 4.3,
                reviewsCount: 5600,
                pricePerNight: 8000
            )
        ]
    }
}

