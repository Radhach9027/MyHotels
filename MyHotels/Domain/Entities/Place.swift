//
//  Place.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation

struct Place: Identifiable, Equatable {
    let id: String
    let name: String
    let category: String
    let coordinate: CLLocationCoordinate2D
    let imageURL: URL?
    let rating: Double
    let reviewsCount: Int
    let summary: String
}

extension Place {
    var clLocation: CLLocation {
        CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
}

extension Place {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.category == rhs.category &&
        lhs.coordinate.latitude == rhs.coordinate.latitude &&
        lhs.coordinate.longitude == rhs.coordinate.longitude &&
        lhs.imageURL == rhs.imageURL &&
        lhs.rating == rhs.rating &&
        lhs.reviewsCount == rhs.reviewsCount &&
        lhs.summary == rhs.summary
    }
}
