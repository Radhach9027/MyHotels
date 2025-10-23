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
        return [
            Hotel(id: "royal-bay",
                  name: "The Royal Bay",
                  city: "Goa, India",
                  imageURL: URL(string: "https://images.unsplash.com/photo-1501117716987-c8e69f433f83?q=80&w=1600&auto=format&fit=crop"),
                  description: "Beachfront resort with infinity pool, private cabanas, and a lively sunset bar.",
                  rating: 4.7, reviewsCount: 1284, pricePerNight: 8999),
            Hotel(id: "skyline-suites",
                  name: "Skyline Suites",
                  city: "Mumbai, India",
                  imageURL: URL(string: "https://images.unsplash.com/photo-1505692794403-34d4982f88aa?q=80&w=1600&auto=format&fit=crop"),
                  description: "Chic city stay with panoramic skyline views, rooftop lounge, and 24/7 concierge.",
                  rating: 4.5, reviewsCount: 2032, pricePerNight: 7599),
            Hotel(id: "monsoon-retreat",
                  name: "Monsoon Retreat",
                  city: "Munnar, India",
                  imageURL: URL(string: "https://images.unsplash.com/photo-1505691723518-36a5ac3b2a59?q=80&w=1600&auto=format&fit=crop"),
                  description: "Mist-kissed hillside cottages, tea-garden treks, and serene spa therapies.",
                  rating: 4.8, reviewsCount: 987, pricePerNight: 6799),
            Hotel(id: "fort-heritage",
                  name: "Fort Heritage",
                  city: "Jaipur, India",
                  imageURL: URL(string: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1600&auto=format&fit=crop"),
                  description: "Royal interiors, courtyard dinners with folk music, and curated heritage walks.",
                  rating: 4.6, reviewsCount: 1540, pricePerNight: 8299)
        ]
    }
}

