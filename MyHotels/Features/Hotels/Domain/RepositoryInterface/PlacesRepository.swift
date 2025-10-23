//
//  PlacesRepository.swift
//  MyHotels
//
//  Created by radha chilamkurthy on 21/10/25.
//

import Foundation
import CoreLocation

protocol PlacesRepository {
    func nearbyPlaces(from: CLLocation, radiusMeters: Int) async throws -> [Place]
}
