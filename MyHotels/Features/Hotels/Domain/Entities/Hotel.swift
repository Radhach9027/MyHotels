//
//  Hotel.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation

struct Hotel: Identifiable, Equatable {
    let id: String
    let name: String
    let city: String
    let imageURL: URL?
    let description: String
    let rating: Double
    let reviewsCount: Int
    let pricePerNight: Int
}
